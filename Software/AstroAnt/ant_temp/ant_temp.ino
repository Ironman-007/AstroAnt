 /*********************************************************************
 This is an example for our nRF52 based Bluefruit LE modules

 Pick one up today in the adafruit shop!

 Adafruit invests time and resources providing this open source code,
 please support Adafruit and open-source hardware by purchasing
 products from Adafruit!

 MIT license, check LICENSE for more information
 All text above, and the splash screen below must be included in
 any redistribution
*********************************************************************/
#include <Wire.h>
#include <bluefruit.h>
#include <Adafruit_LittleFS.h>
#include <InternalFileSystem.h>

// BLE Service
BLEDfu  bledfu;  // OTA DFU service
BLEDis  bledis;  // device information
BLEUart bleuart; // uart over ble
BLEBas  blebas;  // battery

char* devece_name = "ThermoAnt";

const int msg_bye_cnt = 20;

// Data for test
uint8_t reply_buf[20] = {0xEB,0x9F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
// ACK frame
uint8_t start_ack_buf[20] = {0xEB,0x90,0x00,0xAA,0xAA,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
uint8_t cali_ack_buf[20]  = {0xEB,0x90,0x00,0x11,0xAA,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
uint8_t stop_ack_buf[20]  = {0xEB,0x90,0x00,0xEE,0xAA,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
uint8_t err_ack_buf[20]   = {0xEB,0x90,0x00,0xFF,0xAA,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};

uint8_t recv_msg[msg_bye_cnt+1] = {0};

int start_cmd_flag = 0;
int stop_cmd_flag = 0;
int cali_cmd_flag = 0;
int error_cmd_flag = 0;

uint8_t recv_cmd = 0;

const int batt_pin = A0;
int batt_v = 0;
int battValue = 0;
uint8_t batt_level = 0x00;

//https://www.pacer-usa.com/Assets/User/2077-CaliPile_TPiS_1S_1385_5029_27.04.2017.pdf
// CaliPile Registers
#define CALIPILE_TPOBJECT            1
#define CALIPILE_TPAMBIENT           3
#define CALIPILE_TPOBJLP1            5
#define CALIPILE_TPOBJLP2            7
#define CALIPILE_TPAMBLP3           10
#define CALIPILE_TPOBJLP2_FRZN      12
#define CALIPILE_TPPRESENCE         15
#define CALIPILE_TPMOTION           16
#define CALIPILE_TPAMB_SHOCK        17
#define CALIPILE_INTERRUPT_STATUS   18
#define CALIPILE_CHIP_STATUS        19
#define CALIPILE_SLP12              20
#define CALIPILE_SLP3               21
#define CALIPILE_TP_PRES_THLD       22
#define CALIPILE_TP_MOT_THLD        23
#define CALIPILE_TP_AMB_SHOCK_THLD  24
#define CALIPILE_INT_MASK           25
#define CALIPILE_SRC_SELECT         26
#define CALIPILE_TMR_INT            27
#define CALIPILE_TPOT_THR           28

// EEPROM Registers
#define CALIPILE_EEPROM_CONTROL     31
#define CALIPILE_EEPROM_PROTOCOL    32
#define CALIPILE_EEPROM_CHECKSUM    33
#define CALIPILE_EEPROM_LOOKUPNUM   41
#define CALIPILE_EEPROM_PTAT25      42
#define CALIPILE_EEPROM_M           44
#define CALIPILE_EEPROM_U0          46
#define CALIPILE_EEPROM_UOUT1       48
#define CALIPILE_EEPROM_TOBJ1       50
#define CALIPILE_SLAVE_ADDRESS      63

// I2C address when AD0 = AD1 = 0 (default)
#define CALIPILE_ADDRESS 0x0C

// Low-Pass time constants
#define TC_512s    0x00
#define TC_256s    0x01
#define TC_128s    0x02
#define TC_64s     0x03
#define TC_32s     0x04
#define TC_16s     0x05
#define TC_8s      0x08
#define TC_4s      0x09
#define TC_2s      0x0A
#define TC_1s      0x0B
#define TC_0_50s   0x0C
#define TC_0_25s   0x0D

// Sources
#define src_TPOBJ_TPOBJLP2         0x00
#define src_TPOBJLP1_TPOBJLP2      0x01
#define src_TPOBJ_TPOBJLP2_FRZN    0x02
#define src_TPOBJLP1_TPOBJLP2_FRZN 0x03

// Cycle times
#define cycTime_30ms  0x00
#define cycTime_60ms  0x01
#define cycTime_120ms 0x02
#define cycTime_140ms 0x03

bool serialDebug = true, presSign = false, motSign = false;

uint8_t lookUp, rawData[3] = {0, 0, 0}, intStatus, chipStatus, temp;

// Register read variables
uint16_t PTAT25, M, U0, CHECKSUM, TPAMB, TPAMBLP3;
uint32_t TPOBJ, UOUT1, TPOBJLP1, TPOBJLP2, TPOBJLP2FRZN;
uint8_t  TOBJ1, TPPRESENCE, TPMOTION, TPAMBSHK;

// output data for comparisons
float Tamb, Tamblp3, Tobj, Tobjlp1, Tobjlp2, Tobjlp2frzn, Tpres, Tmot, Tambshk, k;

// Encoder counter
uint16_t encoder1Counter = 0;
uint16_t encoder2Counter = 0;

void setup()
{
  // Serial.begin(115200);

#if CFG_DEBUG
  // Blocking wait for connection when debug mode is enabled via IDE
  while ( !Serial ) yield();
#endif

  // Serial.println("BLE_GATT_ATT_MTU_DEFAULT = ");
  // Serial.println(BLE_GATT_ATT_MTU_DEFAULT);

  pinMode(M1_IN1, OUTPUT);
  pinMode(M1_IN2, OUTPUT);
  pinMode(M2_IN1, OUTPUT);
  pinMode(M2_IN2, OUTPUT);

  pinMode(Encoder_A1, INPUT);
  pinMode(Encoder_A2, INPUT);

  attachInterrupt(Encoder_A1, ENC1_INT_Routine, RISING);
  attachInterrupt(Encoder_A2, ENC2_INT_Routine, RISING);

  /* Setup of CaliPile*/
  Wire.begin();
  Wire.setClock(400000); // I2C frequency at 400 kHz  
  delay(500);

  I2Cscan();

  //Initiate I2C transcations with general call/reload command
  writeByte(0x00, 0x04, 0x00);
  delay(1);

  I2Cscan();

 /* Start of EEPROM operations, just have to do once *************************************************** */
 // Check EEPROM protocol number as a test of I2C communication 
  writeByte(CALIPILE_ADDRESS, CALIPILE_EEPROM_CONTROL, 0x80); // enable EEPROM read

  uint8_t c = readByte(CALIPILE_ADDRESS, CALIPILE_EEPROM_PROTOCOL);
  // Serial.print("CaliPile EEPROM protocol number is "); Serial.println(c); 
  // Serial.println("CaliPile EEPROM protocol number should be 3"); 

  uint8_t d = readByte(CALIPILE_ADDRESS, CALIPILE_SLAVE_ADDRESS);
  // Read the EEPROM calibration constants

  lookUp = readByte(CALIPILE_ADDRESS, CALIPILE_EEPROM_LOOKUPNUM);
  // Serial.print("CaliPile LookUpNumber is "); Serial.println(lookUp);

  readBytes(CALIPILE_ADDRESS, CALIPILE_EEPROM_PTAT25, 2, &rawData[0]);
  PTAT25 = ( (uint16_t) rawData[0] << 8) | rawData[1];
  // Serial.print("CaliPile PTAT25 is "); Serial.println(PTAT25);

  readBytes(CALIPILE_ADDRESS, CALIPILE_EEPROM_M, 2, &rawData[0]);
  M = ( (uint16_t) rawData[0] << 8) | rawData[1];
  M /= 100;
  // Serial.print("CaliPile M is "); Serial.println(M);

  readBytes(CALIPILE_ADDRESS, CALIPILE_EEPROM_U0, 2, &rawData[0]);
  U0 = ( (uint16_t) rawData[0] << 8) | rawData[1];
  U0 += 32768;
  // Serial.print("CaliPile U0 is "); Serial.println(U0);

  readBytes(CALIPILE_ADDRESS, CALIPILE_EEPROM_UOUT1, 2, &rawData[0]);
  UOUT1 = ( (uint16_t) rawData[0] << 8) | rawData[1];
  UOUT1 *= 2;
  // Serial.print("CaliPile UOUT1 is "); Serial.println(UOUT1);

  TOBJ1 = readByte(CALIPILE_ADDRESS, CALIPILE_EEPROM_TOBJ1);
  // Serial.print("CaliPile TOBJ1 is "); Serial.println(TOBJ1);

  readBytes(CALIPILE_ADDRESS, CALIPILE_EEPROM_CHECKSUM, 2, &rawData[0]);
  CHECKSUM = ( (uint16_t) rawData[0] << 8) | rawData[1];
  // Serial.print("CaliPile CHECKSUM is supposed to be "); Serial.println(CHECKSUM);

  // Calculate the checksum
  uint16_t sum = 0;
  for(int ii = 35; ii < 64; ii++)
  {
   sum += readByte(CALIPILE_ADDRESS, ii);
  }
  // Serial.print("CaliPile CHECKSUM is "); Serial.println(sum + c);

  writeByte(CALIPILE_ADDRESS, CALIPILE_EEPROM_CONTROL, 0x00); // disable EEPROM read
  /* End of EEPROM operations, just have to do once *************************************************** */
 
  // Initialize the sensor for motion and presence detection
  // Tthr (bit 4), presence (bit(3), motion (bit 2), amb shock (bit 1), timer (bit 0) interrupts allowed
  writeByte(CALIPILE_ADDRESS, CALIPILE_INT_MASK, 0x1C); 
  // time constant for LP1 (bits 0 - 3) and LP2 (bits 4 - 7)
  writeByte(CALIPILE_ADDRESS, CALIPILE_SLP12, TC_8s << 4 | TC_1s);
  // select cycle time (bits 0 - 1) for motion detection, source (bits) 2 - 3) for presence detection
  temp = readByte(CALIPILE_ADDRESS, CALIPILE_SRC_SELECT);
  writeByte(CALIPILE_ADDRESS, CALIPILE_SRC_SELECT, temp | src_TPOBJLP1_TPOBJLP2 << 2 | cycTime_30ms);  
  // select presence and motion thresholds
  writeByte(CALIPILE_ADDRESS, CALIPILE_TP_PRES_THLD, 0x22); // set at 50 counts
  writeByte(CALIPILE_ADDRESS, CALIPILE_TP_MOT_THLD, 0x0A); // set at 10 counts

  // specify the over temperature interrupt threshold (2 bytes)
  writeByte(CALIPILE_ADDRESS, CALIPILE_TPOT_THR, 0x83); // choose 67,072 counts as threshold
  writeByte(CALIPILE_ADDRESS, (CALIPILE_TPOT_THR + 1), 0x00);
  temp = readByte(CALIPILE_ADDRESS, CALIPILE_SRC_SELECT);
  writeByte(CALIPILE_ADDRESS, CALIPILE_SRC_SELECT, temp | 0x10); // interrupt on exceeding threshold
  // Verify threshole set
  readBytes(CALIPILE_ADDRESS, CALIPILE_TPOT_THR, 2, &rawData[0]);
  uint16_t TPOTTHR = ((uint16_t) rawData[0] << 8) | rawData[1];
  // Serial.print("Overtemp threshold = "); Serial.println(TPOTTHR * 2);

  // Construct needed calibration constants (just need to calculate once)
  k = ( (float) (UOUT1 - U0) )/(powf((float)(TOBJ1 + 273.15f), 3.8f) - powf(25.0f + 273.15f, 3.8f) );

  // attachInterrupt(intPin, myinthandler, FALLING);  // define interrupt for INT pin output of CaliPile

  // read interrupt status register(s) to unlatch interrupt before entering main loop
  intStatus  = readByte(CALIPILE_ADDRESS, CALIPILE_INTERRUPT_STATUS);
  // Serial.print("Int status = "); Serial.println(intStatus, HEX);

  /* end of setup of CaliPile*/

  // Setup the BLE LED to be enabled on CONNECT
  // Note: This is actually the default behavior, but provided
  // here in case you want to control this LED manually via PIN 19
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
}

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

void loop()
{
  // Forward from BLEUART to HW Serial
  if ( bleuart.available() )
  {
    // char ch[msg_bye_cnt+1] = {0};
    int ch = 0;
    ch = bleuart.read(recv_msg, msg_bye_cnt);

    recv_cmd = recv_msg[3];
    // Serial.print(bleuart.available());
    // Serial.print(" | ");
    // Serial.println(recv_cmd, HEX);

    bleuart.flush();

    if (recv_msg[2] == 0x00) // Cmd is for this ant.
    {
      if (recv_msg[3] == 0xAA) { // Start cmd
        start_cmd_flag = 1;
        stop_cmd_flag  = 0;
        cali_cmd_flag  = 0;
        // send back command ack
        bleuart.write(start_ack_buf, msg_bye_cnt);
        delay(5);
      }
      else if (recv_msg[3] == 0xEE) { // Stop cmd
        start_cmd_flag = 0;
        stop_cmd_flag  = 1;
        cali_cmd_flag  = 0;
        // send back command ack
        bleuart.write(stop_ack_buf, msg_bye_cnt);
        delay(5);
      }
      else if (recv_msg[3] == 0x11) { // Cali cmd
        start_cmd_flag = 0;
        stop_cmd_flag  = 0;
        cali_cmd_flag  = 1;
        // send back command ack
        bleuart.write(cali_ack_buf, msg_bye_cnt);
        delay(5);
      }
      else { // Wrong cmd
        start_cmd_flag = 0;
        stop_cmd_flag  = 0;
        cali_cmd_flag  = 0;
        // error_cmd_flag = 1;
        // send back command ack
        bleuart.write(err_ack_buf, msg_bye_cnt);
        delay(5);
      }
    }
  }

  if (start_cmd_flag == 1)
  {
    // =================== Run motor ===================
    analogWrite(M1_IN1, 255);
    analogWrite(M1_IN2, 0);

    analogWrite(M2_IN1, 0);
    analogWrite(M2_IN2, 255);

    // =================== Battery level ===================
    battValue = analogRead(batt_pin);
    // Serial.print(battValue);
    // Serial.print(" | ");
    batt_v = float(battValue)/1024*3.3*2*1.09*1000;
    // Serial.println(batt_v);

    if(batt_v<3300) batt_level = 0;
    if(batt_v<3600) batt_level = (batt_v-3300)/30;
    else {
      batt_v = batt_v-3600;
      batt_level = (10 + (batt_v * 0.15F ))>100? 100:(10 + (batt_v * 0.15F ));
    }
    reply_buf[7] = batt_level;

    // =================== Read temperature ===================
    read_temp();
    byte * calipile_temp_obj = (byte *) &Tobj;
    memcpy(&reply_buf[8], calipile_temp_obj, 4);

    // =================== Encoder ===================
    reply_buf[5] = encoder1Counter/256;
    reply_buf[6] = encoder2Counter/256;

    // =================== Send data back ===================
    bleuart.write(reply_buf, msg_bye_cnt);

    delay(50);
  }
  else if (stop_cmd_flag == 1)
  {
    analogWrite(M1_IN1, 0);
    analogWrite(M1_IN2, 0);

    analogWrite(M2_IN1, 0);
    analogWrite(M2_IN2, 0);

    encoder1Counter = 0;
    encoder2Counter = 0;
  }
}

//------------HANDLE ENCODER INTERRUPTS---------------
void ENC1_INT_Routine() { 
  encoder1Counter++; 
}

void ENC2_INT_Routine() { 
  encoder2Counter++;
}

// callback invoked when central connects
void connect_callback(uint16_t conn_handle)
{
  // Get the reference to current connection
  BLEConnection* connection = Bluefruit.Connection(conn_handle);

  char central_name[32] = { 0 };
  connection->getPeerName(central_name, sizeof(central_name));

  // Serial.print("Connected to ");
  // Serial.println(central_name);
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

  // Serial.println();
  // Serial.print("Disconnected, reason = 0x");
  // Serial.println(reason, HEX);
}

// I2C scan function
void I2Cscan() {
// scan for i2c devices
  byte error, address;
  int nDevices;

  // Serial.println("Scanning...");

  nDevices = 0;
  for(address = 1; address < 127; address++) {
    // The i2c_scanner uses the return value of
    // the Write.endTransmission to see if
    // a device did acknowledge to the address.
    Wire.beginTransmission(address);
    error = Wire.endTransmission();

    if (error == 0) {
      /*
      Serial.print("I2C device found at address 0x");
      if (address<16) 
        Serial.print("0");
      Serial.print(address,HEX);
      Serial.println("  !");
      */

      nDevices++;
    }
    else if (error==4) {
      /*
      Serial.print("Unknown error at address 0x");
      if (address<16) 
        Serial.print("0");
      Serial.println(address,HEX);
      */
    }
  }
  /*
  if (nDevices == 0)
    Serial.println("No I2C devices found\n");
  else
    Serial.println("done\n");
  */
}

// I2C read/write functions for the CaliPile sensor

void writeByte(uint8_t address, uint8_t subAddress, uint8_t data) {
  Wire.beginTransmission(address);  // Initialize the Tx buffer
  Wire.write(subAddress);           // Put slave register address in Tx buffer
  Wire.write(data);                 // Put data in Tx buffer
  Wire.endTransmission();           // Send the Tx buffer
}                                                                                                                                                                  

uint8_t readByte(uint8_t address, uint8_t subAddress) {
  uint8_t data; // `data` will store the register data
  Wire.beginTransmission(address);         // Initialize the Tx buffer
  Wire.write(subAddress);                  // Put slave register address in Tx buffer
  Wire.endTransmission(false);             // Send the Tx buffer, but send a restart to keep connection alive
  Wire.requestFrom(address, 1);            // Read one byte from slave register address 
  data = Wire.read();                      // Fill Rx buffer with result
  return data;                             // Return data read from slave register
}

void readBytes(uint8_t address, uint8_t subAddress, uint8_t count, uint8_t * dest) {  
  Wire.beginTransmission(address);   // Initialize the Tx buffer
  Wire.write(subAddress);            // Put slave register address in Tx buffer
  Wire.endTransmission(false);       // Send the Tx buffer, but send a restart to keep connection alive
  uint8_t i = 0;
  Wire.requestFrom(address, count);  // Read bytes from slave register address 
  while (Wire.available()) {dest[i++] = Wire.read(); } // Put read results in the Rx buffer
}

void read_temp() {
// read the ambient temperature
  readBytes(CALIPILE_ADDRESS, CALIPILE_TPAMBIENT, 2, &rawData[0]);
  TPAMB = ( (uint16_t)(rawData[0] & 0x7F) << 8) | rawData[1] ; 

  Tamb = 298.15f + ((float)TPAMB - (float)PTAT25) * (1.0f/(float) M);

  // read the object temperature
  readBytes(CALIPILE_ADDRESS, CALIPILE_TPOBJECT, 3, &rawData[0]);
  TPOBJ = ( (uint32_t) ( (uint32_t)rawData[0] << 24) | ( (uint32_t)rawData[1] << 16) | ( (uint32_t)rawData[2] & 0x80) << 8) >> 15; 

  float temp0 = powf(Tamb, 3.8f);
  float temp1 = ( ((float) TPOBJ) - ((float) U0)  ) / k ;
  Tobj = powf( (temp0 + temp1), 0.2631578947f );
}

