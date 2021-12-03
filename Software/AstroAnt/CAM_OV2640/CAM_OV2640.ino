#include <Wire.h>
#include <ArduCAM.h>
#include <SPI.h>
#include "memorysaver.h"

#include <bluefruit.h>
#include <Adafruit_LittleFS.h>
#include <InternalFileSystem.h>

// ACK type
const uint8_t CAM_START       = 0x00;
const uint8_t SPI_ERR         = 0x01;
const uint8_t SPI_OK          = 0x02;
const uint8_t NO_OV2640       = 0x03;
const uint8_t OV2640_DETECTED = 0x04;
const uint8_t OV2640_160_120  = 0x05;
const uint8_t SET_MODE_2      = 0x06;

// ==================== BLE arameters ====================
// BLE Service
BLEDfu  bledfu;  // OTA DFU service
BLEDis  bledis;  // device information
BLEUart bleuart; // uart over ble
BLEBas  blebas;  // battery

char* devece_name = "CamAnt";

const int msg_bye_cnt = 20;

const uint8_t node_address = 0x02;

// ACK for test
uint8_t ack_buf[20] = {0xEB,0x9F,node_address,0x00,'F','Z','L',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
// Data frame
uint8_t data_buf[20] = {0};

uint8_t recv_msg[msg_bye_cnt+1] = {0};

int frame_len = 0;

void startAdv(void)
{
  // Advertising packet
  Bluefruit.Advertising.addFlags(BLE_GAP_ADV_FLAGS_LE_ONLY_GENERAL_DISC_MODE);
  Bluefruit.Advertising.addTxPower();

  // Include bleuart 128-bit uuid
  Bluefruit.Advertising.addService(bleuart);

  // Secondary Scan Response packet (optional)
  // Since there is no room for 'Name' in Advertising packet
  Bluefruit.ScanResponse.addName();

  /* Start Advertising
   * - Enable auto advertising if disconnected
   * - Interval:  fast mode = 20 ms, slow mode = 152.5 ms
   * - Timeout for fast mode is 30 seconds
   * - Start(timeout) with timeout = 0 will advertise forever (until connected)
   * 
   * For recommended advertising interval
   * https://developer.apple.com/library/content/qa/qa1931/_index.html   
   */
  Bluefruit.Advertising.restartOnDisconnect(true);
  Bluefruit.Advertising.setInterval(32, 244);    // in unit of 0.625 ms
  Bluefruit.Advertising.setFastTimeout(30);      // number of seconds in fast mode
  Bluefruit.Advertising.start(0);                // 0 = Don't stop advertising after n seconds  
}

/*
#if !(defined OV2640_MINI_2MP)
  #error Please select the hardware platform and camera module in the ../libraries/ArduCAM/memorysaver.h file
#endif
*/

#define BMPIMAGEOFFSET 66

const char bmp_header[BMPIMAGEOFFSET] PROGMEM =
{
  0x42, 0x4D, 0x36, 0x58, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x28, 0x00,
  0x00, 0x00, 0x40, 0x01, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00, 0x01, 0x00, 0x10, 0x00, 0x03, 0x00,
  0x00, 0x00, 0x00, 0x58, 0x02, 0x00, 0xC4, 0x0E, 0x00, 0x00, 0xC4, 0x0E, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x00, 0x00, 0xE0, 0x07, 0x00, 0x00, 0x1F, 0x00,
  0x00, 0x00
};

const int CS = SS;

bool is_header = false;
int mode = 0;
uint8_t start_capture = 0;

#if defined (OV2640_MINI_2MP)
  ArduCAM myCAM( OV2640, CS );
#else
  ArduCAM myCAM( OV5642, CS );
#endif

uint8_t read_fifo_burst(ArduCAM myCAM);

void setup() {
  // Serial.begin(115200);
  // while ( !Serial ) delay(10);   // for nrf52840 with native usb

  // ======================= BLE setup =======================
  Bluefruit.autoConnLed(true);

  // Config the peripheral connection with maximum bandwidth 
  // more SRAM required by SoftDevice
  // Note: All config***() function must be called before begin()
  Bluefruit.configPrphBandwidth(BANDWIDTH_MAX);

  Bluefruit.begin();
  Bluefruit.setTxPower(4);    // Check bluefruit.h for supported values
  //Bluefruit.setName(getMcuUniqueID()); // useful testing with multiple central connections
  Bluefruit.setName(devece_name);
  Bluefruit.Periph.setConnectCallback(connect_callback);
  Bluefruit.Periph.setDisconnectCallback(disconnect_callback);

  // To be consistent OTA DFU should be added first if it exists
  bledfu.begin();

  // Configure and Start Device Information Service
  bledis.setManufacturer("Adafruit Industries");
  bledis.setModel("Bluefruit Feather52");
  bledis.begin();

  // Configure and Start BLE Uart Service
  bleuart.begin();

  // Start BLE Battery Service
  blebas.begin();
  blebas.write(10);

  // Set up and start advertising
  startAdv();

  // Serial.println("Please use Adafruit's Bluefruit LE app to connect in UART mode");
  // Serial.println("Once connected, enter character(s) that you wish to send");

  uint8_t vid, pid;
  uint8_t temp;
  #if defined(__SAM3X8E__)
    Wire1.begin();
    // Serial.begin(115200);
    // while(!Serial) delay(10);
  #else
    Wire.begin();
    // Serial.begin(921600);
    // while(!Serial) delay(10);
  #endif

  send_ack(CAM_START);
  // Serial.println(F("ACK CMD ArduCAM Start! END"));

  // set the CS as an output:
  pinMode(CS, OUTPUT);
  digitalWrite(CS, HIGH);

  // initialize SPI:
  SPI.begin();

  //Reset the CPLD
  myCAM.write_reg(0x07, 0x80);
  delay(100);

  myCAM.write_reg(0x07, 0x00);
  delay(100);

  while(1){
    //Check if the ArduCAM SPI bus is OK
    myCAM.write_reg(ARDUCHIP_TEST1, 0x55);
    temp = myCAM.read_reg(ARDUCHIP_TEST1);

    if (temp != 0x55){
      // Serial.println(F("ACK CMD SPI interface Error! END"));
      send_ack(SPI_ERR);
      delay(1000);
      continue;
    }
    else{
      send_ack(SPI_OK);
      // Serial.println(F("ACK CMD SPI interface OK. END"));
      break;
    }
  }

  #if defined (OV2640_MINI_2MP)
    while(1){
      //Check if the camera module type is OV2640
      myCAM.wrSensorReg8_8(0xff, 0x01);
      myCAM.rdSensorReg8_8(OV2640_CHIPID_HIGH, &vid);
      myCAM.rdSensorReg8_8(OV2640_CHIPID_LOW, &pid);

      if ((vid != 0x26 ) && (( pid != 0x41 ) || ( pid != 0x42 )))
      {
        // Serial.println(F("ACK CMD Can't find OV2640 module! END"));
        send_ack(NO_OV2640);
        delay(1000);
        continue;
      }
      else
      {
        send_ack(OV2640_DETECTED);
        // Serial.println(F("ACK CMD OV2640 detected. END"));
        break;
      } 
    }
  #else
    while(1){
      //Check if the camera module type is OV5642
      myCAM.wrSensorReg16_8(0xff, 0x01);
      myCAM.rdSensorReg16_8(OV5642_CHIPID_HIGH, &vid);
      myCAM.rdSensorReg16_8(OV5642_CHIPID_LOW, &pid);
      if((vid != 0x56) || (pid != 0x42)){
        // send_ack();
        // Serial.println(F("ACK CMD Can't find OV5642 module! END"));
        delay(1000);continue;
      }
      else{
        // Serial.println(F("ACK CMD OV5642 detected. END"));break;
      } 
    }
  #endif

  //Change to JPEG capture mode and initialize the OV5642 module
  myCAM.set_format(JPEG);
  myCAM.InitCAM();

  // configuration
  // FZ: set to fixed resolution 320x240
  myCAM.OV2640_set_JPEG_size(OV2640_160x120);
  delay(1000);
  send_ack(OV2640_160_120);
  // Serial.println(F("ACK CMD switch to OV2640_160x120 END"));
  temp = 0xff;

  /*
  #if defined (OV2640_MINI_2MP)
    myCAM.OV2640_set_JPEG_size(OV2640_320x240);
  #else
    myCAM.write_reg(ARDUCHIP_TIM, VSYNC_LEVEL_MASK);   //VSYNC is active HIGH
    myCAM.OV5642_set_JPEG_size(OV5642_320x240);
  #endif
  */

  delay(1000);
  myCAM.clear_fifo_flag();

  #if !(defined (OV2640_MINI_2MP))
  myCAM.write_reg(ARDUCHIP_FRAMES,0x00);
  #endif
}

void loop() {
  uint8_t temp = 0xff, temp_last = 0;
  bool is_header = false;

  if ( bleuart.available() )
  {
    int ch = 0;
    ch = bleuart.read(recv_msg, msg_bye_cnt);

    temp = recv_msg[3];

    bleuart.flush();

    if (temp == 0x20)
    {
      delay(50);
      mode = 2;
      temp = 0xff;
      start_capture = 2;
      send_ack(SET_MODE_2);
    }
  }

  /*
  if (Serial.available())
  {
    temp = Serial.read();

    if (temp == 0x20)
    {
      delay(50);
      mode = 2;
      temp = 0xff;
      start_capture = 2;
      send_ack();
      // Serial.println(F("ACK CMD CAM start video streaming. END"));
    }
  }
  */

  if (mode == 2)
  {
    while (1)
    {
      if ( bleuart.available() )
      {
        int chh = 0;
        chh = bleuart.read(recv_msg, msg_bye_cnt);

        temp = recv_msg[3];

        bleuart.flush();

        if (temp == 0x21)
        {
          start_capture = 0;
          mode = 0;
          break;
        }
      }

      if (start_capture == 2)
      {
        myCAM.flush_fifo();
        myCAM.clear_fifo_flag();

        //Start capture
        myCAM.start_capture();
        start_capture = 0;
      }

      if (myCAM.get_bit(ARDUCHIP_TRIG, CAP_DONE_MASK))
      {
        uint32_t length = 0;
        length = myCAM.read_fifo_length();

        // if the length is too big or 0, then skip the current reading.
        if ((length >= MAX_FIFO_SIZE) | (length == 0))
        {
          myCAM.clear_fifo_flag();
          start_capture = 2;
          continue;
        }

        myCAM.CS_LOW();
        myCAM.set_fifo_burst(); // Set fifo burst mode
        temp = SPI.transfer(0x00);
        length --;

        while ( length-- )
        {
          temp_last = temp;
          temp = SPI.transfer(0x00);

          if (is_header == true)
          {
            send_frame_data(temp);
            // Serial.write(temp);
          }
          else if ((temp == 0xD8) && (temp_last == 0xFF))
          {
            is_header = true;
            send_frame_data(temp_last);
            send_frame_data(temp);
            // Serial.write(temp_last);
            // Serial.write(temp);
          }
          if ((temp == 0xD9) && (temp_last == 0xFF))
          { //If find the end ,break while,
            break;
          }

          delayMicroseconds(15);
        }

        myCAM.CS_HIGH();
        myCAM.clear_fifo_flag();
        start_capture = 2;
        is_header = false;
      }
    }
  }
}

// send ack message back to central station
void send_ack(uint8_t type) {
  ack_buf[3] = type;
  bleuart.write(ack_buf, msg_bye_cnt);

  // Serial.print("reply: ");
  // Serial.println(type);

  delay(5);
}

// send image data back
// the BLEUART service can send 20bytes per package
// this function can assemble the data into frames and send to central station
void send_frame_data(uint8_t imgdata)
{
  data_buf[frame_len] = imgdata;

  frame_len += 1;

  // if we have 20 bytes of data, send the frame out
  if (frame_len == 20)
  {
    bleuart.write(data_buf, msg_bye_cnt);
    frame_len = 0;
    delay(5);
  }
}


uint8_t read_fifo_burst(ArduCAM myCAM)
{
  uint8_t temp = 0, temp_last = 0;
  uint32_t length = 0;
  length = myCAM.read_fifo_length();
  // Serial.println(length, DEC);
  if (length >= MAX_FIFO_SIZE) //512 kb
  {
    // Serial.println(F("ACK CMD Over size. END"));
    return 0;
  }
  if (length == 0 ) //0 kb
  {
    // Serial.println(F("ACK CMD Size is 0. END"));
    return 0;
  }
  myCAM.CS_LOW();
  myCAM.set_fifo_burst();//Set fifo burst mode
  temp =  SPI.transfer(0x00);
  length --;

  while ( length-- )
  {
    temp_last = temp;
    temp =  SPI.transfer(0x00);
    if (is_header == true)
    {
      //Serial.write(temp);
    }
    else if ((temp == 0xD8) & (temp_last == 0xFF))
    {
      is_header = true;
      // Serial.println(F("ACK IMG END"));
      // Serial.write(temp_last);
      // Serial.write(temp);
    }
    if ( (temp == 0xD9) && (temp_last == 0xFF) ) //If find the end ,break while,
    break;
    delayMicroseconds(15);
  }
  myCAM.CS_HIGH();
  is_header = false;
  return 1;
}

// callback invoked when central connects
void connect_callback(uint16_t conn_handle)
{
  // Get the reference to current connection
  BLEConnection* connection = Bluefruit.Connection(conn_handle);

  char central_name[32] = { 0 };
  connection->getPeerName(central_name, sizeof(central_name));
}

/**
 * Callback invoked when a connection is dropped
 * @param conn_handle connection where this event happens
 * @param reason is a BLE_HCI_STATUS_CODE which can be found in ble_hci.h
 */
void disconnect_callback(uint16_t conn_handle, uint8_t reason)
{
  (void) conn_handle;
  (void) reason;
}
