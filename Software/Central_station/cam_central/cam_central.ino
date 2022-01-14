#include <bluefruit.h>

// ACK type
const uint8_t CAM_START       = 0x00;
const uint8_t SPI_ERR         = 0x01;
const uint8_t SPI_OK          = 0x02;
const uint8_t NO_OV2640       = 0x03;
const uint8_t OV2640_DETECTED = 0x04;
const uint8_t OV2640_160_120  = 0x05;
const uint8_t SET_MODE_2      = 0x06;

// Struct containing peripheral info
typedef struct
{
  char name[16+1];

  uint16_t conn_handle;

  // Each prph need its own bleuart client service
  BLEClientUart bleuart;
} prph_info_t;

prph_info_t prphs[BLE_MAX_CONNECTION];

// Software Timer for blinking the RED LED
SoftwareTimer blinkTimer;
uint8_t connection_num = 0; // for blink pattern

// How many bytes in a msg
#define data_cnt 20

uint8_t start_cmd[data_cnt+1] = {0xEB,0x90,0x00,0x20,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xAF};
uint8_t stop_cmd[data_cnt+1]  = {0xEB,0x90,0x00,0x21,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xAF};

uint8_t PC_cmd = 0;

int START_CMD_PIN = 6;
int STOP_CMD_PIN  = 9;

int START_CMD_PIN_val = 0;
int STOP_CMD_PIN_val  = 0;

int START_CMD_sent_flag = 0;
int STOP_CMD_sent_flag  = 0;

void setup() 
{
  Serial.begin(921600);
  while ( !Serial ) delay(10);   // for nrf52840 with native usb

  // Initialize blinkTimer for 100 ms and start it
  blinkTimer.begin(100, blink_timer_callback);
  blinkTimer.start();

  pinMode(START_CMD_PIN, INPUT);
  pinMode(STOP_CMD_PIN, INPUT);

  Bluefruit.begin(0, 4);

  // Set Name
  Bluefruit.setName("Bluefruit52 Central");

  // Init peripheral pool
  for (uint8_t idx=0; idx<BLE_MAX_CONNECTION; idx++)
  {
    // Invalid all connection handle
    prphs[idx].conn_handle = BLE_CONN_HANDLE_INVALID;
    
    // All of BLE Central Uart Serivce
    prphs[idx].bleuart.begin();
    prphs[idx].bleuart.setRxCallback(bleuart_rx_callback);
  }

  // Callbacks for Central
  Bluefruit.Central.setConnectCallback(connect_callback);
  Bluefruit.Central.setDisconnectCallback(disconnect_callback);

  Bluefruit.Scanner.setRxCallback(scan_callback);
  Bluefruit.Scanner.restartOnDisconnect(true);
  Bluefruit.Scanner.setInterval(160, 80);       // in units of 0.625 ms
  Bluefruit.Scanner.filterUuid(BLEUART_UUID_SERVICE);
  Bluefruit.Scanner.useActiveScan(false);       // Don't request scan response data
  Bluefruit.Scanner.start(0);                   // 0 = Don't stop scanning after n seconds
}

/**
 * Callback invoked when scanner picks up an advertising packet
 * @param report Structural advertising data
 */
void scan_callback(ble_gap_evt_adv_report_t* report)
{
  // Since we configure the scanner with filterUuid()
  // Scan callback only invoked for device with bleuart service advertised  
  // Connect to the device with bleuart service in advertising packet
  Bluefruit.Central.connect(report);
}

/**
 * Callback invoked when an connection is established
 * @param conn_handle
 */
void connect_callback(uint16_t conn_handle)
{
  // Find an available ID to use
  int id  = findConnHandle(BLE_CONN_HANDLE_INVALID);

  // Eeek: Exceeded the number of connections !!!
  if ( id < 0 ) return;

  prph_info_t* peer = &prphs[id];
  peer->conn_handle = conn_handle;

  Bluefruit.Connection(conn_handle)->getPeerName(peer->name, sizeof(peer->name)-1);

  // Serial.print("Connected to ");
  // Serial.println(peer->name);

  // Serial.print("Discovering BLE UART service ... ");

  if ( peer->bleuart.discover(conn_handle) )
  {
    // Serial.println("Found it");
    // Serial.println("Enabling TXD characteristic's CCCD notify bit");
    peer->bleuart.enableTXD();

    // Serial.println("Continue scanning for more peripherals");
    Bluefruit.Scanner.start(0);

    // Serial.println("Enter some text in the Serial Monitor to send it to all connected peripherals:");
  }
  else
  {
    // disconnect since we couldn't find bleuart service
    Bluefruit.disconnect(conn_handle);
  }

  connection_num++;
  Serial.println(F("ACK CMD Connected with a CamAnt END"));
}

/**
 * Callback invoked when a connection is dropped
 * @param conn_handle
 * @param reason is a BLE_HCI_STATUS_CODE which can be found in ble_hci.h
 */
void disconnect_callback(uint16_t conn_handle, uint8_t reason)
{
  (void) conn_handle;
  (void) reason;

  connection_num--;
  Serial.println(F("ACK CMD Disconnected with a CamAnt END"));

  // Mark the ID as invalid
  int id  = findConnHandle(conn_handle);

  // Non-existant connection, something went wrong, DBG !!!
  if ( id < 0 ) return;

  // Mark conn handle as invalid
  prphs[id].conn_handle = BLE_CONN_HANDLE_INVALID;
}

/**
 * Callback invoked when BLE UART data is received
 * @param uart_svc Reference object to the service where the data 
 * arrived.
 */
void bleuart_rx_callback(BLEClientUart& uart_svc)
{
  // uart_svc is prphs[conn_handle].bleuart
  uint16_t conn_handle = uart_svc.connHandle();

  int id = findConnHandle(conn_handle);
  prph_info_t* peer = &prphs[id];

  // Read then forward to all peripherals
  while ( uart_svc.available() )
  {
    // default MTU with an extra byte for string terminator
    char buf[data_cnt+1] = { 0 };

    if ( uart_svc.read(buf,sizeof(buf)-1) )
    {
      if (START_CMD_sent_flag == 0)
      {
        Serial.println(F("ACK CMD Got data from ant! END"));
        switch (buf[3]) {
          case CAM_START:
            Serial.println(F("ACK CMD ArduCAM Start! END"));
            break;

          case SPI_ERR:
            Serial.println(F("ACK CMD SPI_ERR! END"));
            break;

          case SPI_OK:
            Serial.println(F("ACK CMD SPI_OK! END"));
            break;

          case NO_OV2640:
            Serial.println(F("ACK CMD NO_OV2640! END"));
            break;

          case OV2640_DETECTED:
            Serial.println(F("ACK CMD OV2640_DETECTED! END"));
            break;

          case OV2640_160_120:
            Serial.println(F("ACK CMD OV2640_160_120! END"));
            break;

          case SET_MODE_2:
            Serial.println(F("ACK CMD SET_MODE_2! END"));
            break;
        }
      }
      else
        Serial.write(buf, sizeof(buf)-1);
    }
  }
}

/**
 * Helper function to send a string to all connected peripherals
 */
void sendAll(const uint8_t* str)
{
  prph_info_t* peer = &prphs[0];

  if ( peer->bleuart.discovered() )
  {
    // Serial.println("peer->bleuart.discovered()");
    peer->bleuart.write(str, data_cnt);
  }
}

void loop()
{
  if (Serial.available())
  {
    PC_cmd = Serial.read();

    if (PC_cmd == 0x20)
      if (Bluefruit.Central.connected()) {
        sendAll(start_cmd);
        START_CMD_sent_flag = 1;
      }

    if (PC_cmd == 0x21)
      if (Bluefruit.Central.connected()) {
        sendAll(stop_cmd);
        START_CMD_sent_flag = 0;
      }
  }
}

/**
 * Find the connection handle in the peripheral array
 * @param conn_handle Connection handle
 * @return array index if found, otherwise -1
 */
int findConnHandle(uint16_t conn_handle)
{
  for(int id=0; id<BLE_MAX_CONNECTION; id++)
  {
    if (conn_handle == prphs[id].conn_handle)
    {
      return id;
    }
  }

  return -1;  
}

/**
 * Software Timer callback is invoked via a built-in FreeRTOS thread with
 * minimal stack size. Therefore it should be as simple as possible. If
 * a periodically heavy task is needed, please use Scheduler.startLoop() to
 * create a dedicated task for it.
 * 
 * More information http://www.freertos.org/RTOS-software-timer.html
 */
void blink_timer_callback(TimerHandle_t xTimerID)
{
  (void) xTimerID;

  // Period of sequence is 10 times (1 second). 
  // RED LED will toggle first 2*n times (on/off) and remain off for the rest of period
  // Where n = number of connection
  static uint8_t count = 0;

  if ( count < 2*connection_num ) digitalToggle(LED_RED);
  if ( count % 2 && digitalRead(LED_RED)) digitalWrite(LED_RED, LOW); // issue #98

  count++;
  if (count >= 10) count = 0;
}
