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
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <SPI.h>
#include <Wire.h>
#include <bluefruit.h>
#include <Adafruit_LittleFS.h>
#include <InternalFileSystem.h>
#include "NRF52TimerInterrupt.h"
#include "NRF52_ISR_Timer.h"

// BLE Service
BLEDfu  bledfu;  // OTA DFU service
BLEDis  bledis;  // device information
BLEUart bleuart; // uart over ble
BLEBas  blebas;  // battery

char* devece_name = "BridgeAnt";

const int msg_bye_cnt = 20;

const int motor_speed = 200;

const uint8_t node_address = 0x04;

// Data for test
uint8_t reply_buf[20]     = {0xEB,0x9F,node_address,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
// ACK frame
uint8_t start_ack_buf[20] = {0xEB,0x90,node_address,0xAA,0xAA,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
uint8_t cali_ack_buf[20]  = {0xEB,0x90,node_address,0x11,0xAA,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
uint8_t stop_ack_buf[20]  = {0xEB,0x90,node_address,0xEE,0xAA,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
uint8_t err_ack_buf[20]   = {0xEB,0x90,node_address,0xFF,0xAA,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};

uint8_t recv_msg[msg_bye_cnt+1] = {0};

int start_cmd_flag = 0;
int stop_cmd_flag = 0;
int cali_cmd_flag = 0;
int cali_done_flag = 0;
int error_cmd_flag = 0;

uint8_t recv_cmd = 0;

const int batt_pin = A0;
int batt_v = 0;
int battValue = 0;
uint8_t batt_level = 0x00;
uint8_t counter = 0;

// =========== MPU6050 ===========
Adafruit_MPU6050 mpu;

// =========== interrupt parameter ===========
#define HW_TIMER_INTERVAL_MS 1

NRF52Timer ITimer(NRF_TIMER_1);
NRF52_ISR_Timer ISR_Timer;

// interrupt interval: send back data every 50ms
#define TIMER_INTERVAL_50ms 50L
bool timer4Interrupt = false;

void TimerHandler()
{
  ISR_Timer.run();
}

// ========= PID parameters ==========
/* IMU Data */
float gyroZangle = 0.0;     // Angle calculate using the gyro only
float gyroZangle_pre = 0.0; // Angle calculate using the gyro only

float dev_Xangle = 0.0;
float dev_Yangle = 0.0;
float dev_Zangle = 0.0;

float gyroXrate = 0.0;
float gyroYrate = 0.0;
float gyroZrate = 0.0;

float accelx = 0.0;
float accely = 0.0;
float accelz = 0.0;

float yy = 0;
float yy_acc = 0;
float yy_pre = 0;
float dev_yy = 0;

// Play with the PID parameters
float tau_p = 50;
float tau_d = 10;
float tau_i = 1;

// Encoder counter
uint16_t encoder1Counter = 0;
uint16_t encoder2Counter = 0;

uint8_t encoder1Counter_pre = 0;
uint8_t encoder2Counter_pre = 0;

signed char dev_encoder1Counter = 0;
signed char dev_encoder2Counter = 0;

const int cali_data_len = 40; // accumulate 2s of IMU data for calibration.

float shift_reg_x[cali_data_len] = {0};
float shift_reg_y[cali_data_len] = {0};
float shift_reg_z[cali_data_len] = {0};

uint32_t timer = 0;

int i = 0;
int ii = 0;

float cali_sum_x = 0.0;
float cali_x = 0.0;

float cali_sum_y = 0.0;
float cali_y = 0.0;

float cali_sum_z = 0.0;
float cali_z = 0.0;

float cali_bias_x = 0.0;
float cali_bias_y = 0.0;
float cali_bias_z = 0.0;

int ix = 0;
int iy = 0;
int iz = 0;
int ig = 0;

int steer = 0;
float steer_f = 0.0;

// int overflow_flag = 0;

// ========== SVD ==========
float aa = 1.6924895;
float bb = 6.1480306;

void setup()
{
  // Serial.begin(115200);
  // while (!Serial);

  // Serial.println("BLE_GATT_ATT_MTU_DEFAULT = ");
  // Serial.println(BLE_GATT_ATT_MTU_DEFAULT);

  pinMode(LED_RED, OUTPUT);

  pinMode(M1_IN1, OUTPUT);
  pinMode(M1_IN2, OUTPUT);
  pinMode(M2_IN1, OUTPUT);
  pinMode(M2_IN2, OUTPUT);

  pinMode(Encoder_A1, INPUT);
  pinMode(Encoder_A2, INPUT);

  attachInterrupt(Encoder_A1, ENC1_INT_Routine, RISING);
  attachInterrupt(Encoder_A2, ENC2_INT_Routine, RISING);

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

  // ============== Interrupt ==============
  // Interval in microsecs
  ITimer.attachInterruptInterval(HW_TIMER_INTERVAL_MS * 1000, TimerHandler);

  // Just to demonstrate, don't use too many ISR Timers if not absolutely necessary
  // You can use up to 16 timer for each ISR_Timer
  ISR_Timer.setInterval(TIMER_INTERVAL_50ms, timer_handler);

  // ============== MPU6050 ==============
  cali_sum_x = 0.0;
  cali_sum_y = 0.0;
  cali_sum_z = 0.0;

  // Try to initialize!
  mpu.begin();

  mpu.setAccelerometerRange(MPU6050_RANGE_2_G);
  mpu.setGyroRange(MPU6050_RANGE_250_DEG);
  mpu.setFilterBandwidth(MPU6050_BAND_10_HZ);
  delay(10);

  gyroZangle = 0.0;

  yy = 0;
  dev_yy = 0;

  timer = micros();
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

    bleuart.flush();

    if (recv_msg[2] == node_address) // Cmd is for this ant.
    {
      if (recv_msg[3] == 0xAA) { // Start cmd
        start_cmd_flag = 1;
        stop_cmd_flag  = 0;
        cali_cmd_flag  = 0;
        cali_done_flag = 0;
        // send back command ack
        bleuart.write(start_ack_buf, msg_bye_cnt);
        delay(5);
      }
      else if (recv_msg[3] == 0xEE) { // Stop cmd
        start_cmd_flag = 0;
        stop_cmd_flag  = 1;
        cali_cmd_flag  = 0;
        cali_done_flag = 0;

        yy_acc = 0;
        yy_pre = 0;
        yy = 0;
        dev_yy = 0;

        gyroZangle = 0.0;

        // send back command ack
        bleuart.write(stop_ack_buf, msg_bye_cnt);
        delay(5);
      }
      else if (recv_msg[3] == 0x11) { // Cali cmd
        start_cmd_flag = 0;
        stop_cmd_flag  = 0;
        cali_cmd_flag  = 1;
        cali_done_flag = 0;
        // send back command ack
        delay(5);
      }
      else { // Wrong cmd
        start_cmd_flag = 0;
        stop_cmd_flag  = 0;
        cali_cmd_flag  = 0;
        cali_done_flag = 0;
        // send back command ack
        bleuart.write(err_ack_buf, msg_bye_cnt);
        delay(5);
      }
    }
  }

  if (timer4Interrupt == true)
  {
    // ============= capturing gyro data in shift register =============
    sensors_event_t a, g, temp;
    mpu.getEvent(&a, &g, &temp);

    gyroXrate = (g.gyro.x)*57.2958-cali_x;
    gyroYrate = (g.gyro.y)*57.2958-cali_y;
    gyroZrate = (g.gyro.z)*57.2958-cali_z;

    // Storing data in shift registers
    for (ix=cali_data_len-1; ix>0; ix--)
      shift_reg_x[ix] = shift_reg_x[ix-1];
    shift_reg_x[0] = gyroXrate;

    for (iy=cali_data_len-1; iy>0; iy--)
      shift_reg_y[iy] = shift_reg_y[iy-1];
    shift_reg_y[0] = gyroYrate;

    for (iz=cali_data_len-1; iz>0; iz--)
      shift_reg_z[iz] = shift_reg_z[iz-1];
    shift_reg_z[0] = gyroZrate;

    // ====================================================
    // ===               Cali command                   ===
    // ====================================================
    // Got the cali cmd and the cali is not done
    if (cali_cmd_flag == 1 && cali_done_flag == 0)
    {
      cali_sum_x = 0.0;
      cali_sum_y = 0.0;
      cali_sum_z = 0.0;

      for (ix=0; ix<cali_data_len; ix++) cali_sum_x += shift_reg_x[ix];
      for (iy=0; iy<cali_data_len; iy++) cali_sum_y += shift_reg_y[iy];
      for (iz=0; iz<cali_data_len; iz++) cali_sum_z += shift_reg_z[iz];

      cali_bias_x = cali_sum_x/cali_data_len;
      cali_bias_y = cali_sum_y/cali_data_len;
      cali_bias_z = cali_sum_z/cali_data_len;

      // calculate bias
      cali_x = cali_bias_x + cali_x;
      cali_y = cali_bias_y + cali_y;
      cali_z = cali_bias_z + cali_z;

      cali_done_flag = 1;

      bleuart.write(cali_ack_buf, msg_bye_cnt);
    }

    if (start_cmd_flag == 1)
    {
      // =================== Run motor ===================
      run_motor();

      // =================== Frame number ===================
      reply_buf[3] = counter;

      // =================== Read Battery level ===================
      battValue = analogRead(batt_pin);
      batt_v = float(battValue)/1024*3.3*2*1.09*1000;

      if(batt_v<3300) batt_level = 0;
      if(batt_v<3600) batt_level = (batt_v-3300)/30;
      else {
        batt_v = batt_v-3600;
        batt_level = (10 + (batt_v * 0.15F ))>100? 100:(10 + (batt_v * 0.15F ));
      }
      reply_buf[10] = batt_level;

      // =================== Encoder ===================
      reply_buf[8] = encoder1Counter/256;
      reply_buf[9] = encoder2Counter/256;

      // =================== PID control ===================
      float dt = (float)(micros() - timer) / 1000000; // Calculate delta time
      timer = micros();

      gyroZangle += gyroZrate * dt;

      byte * bz = (byte *) &gyroZangle;

      memcpy(&reply_buf[4], bz, 4);

      dev_encoder2Counter = encoder2Counter - encoder2Counter_pre;
      if (dev_encoder2Counter < 0)  dev_encoder2Counter += 255;
      encoder2Counter_pre = encoder2Counter;

      dev_Zangle = gyroZangle - gyroZangle_pre;
      gyroZangle_pre = gyroZangle;

      yy_acc += yy;
      yy_pre = yy;
      yy = yy_pre + dev_encoder2Counter * sin(dev_Zangle * 0.0174533);
      dev_yy = yy - yy_pre;

      steer_f = (-tau_p * yy) - (tau_d * dev_yy) - (tau_i * yy_acc);
      steer = round(steer_f);

      if (steer >= (255-motor_speed)) steer = 255-motor_speed;
      else if (steer <= -motor_speed) steer = -motor_speed;

      byte * steer_b = (byte *) &steer;
      memcpy(&reply_buf[11], steer_b, 4);

      // =================== Send data back ===================
      bleuart.write(reply_buf, msg_bye_cnt);

      digitalWrite(LED_RED, !digitalRead(LED_RED));
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
    timer4Interrupt = false;
  }
}

void stop_motor() {
  analogWrite(M1_IN1, 0);
  analogWrite(M1_IN2, 0);

  analogWrite(M2_IN1, 0);
  analogWrite(M2_IN2, 0);
}

void run_motor() {
  // NO PID
  /*
  analogWrite(M1_IN1, 230);
  analogWrite(M1_IN2, 0);

  analogWrite(M2_IN1, 0);
  analogWrite(M2_IN2, 200);
  */

  // for PID
  analogWrite(M1_IN1, motor_speed + steer);
  analogWrite(M1_IN2, 0);

  analogWrite(M2_IN1, 0);
  analogWrite(M2_IN2, motor_speed);
}

void timer_handler() {
  timer4Interrupt = true;
  counter++;
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

// going forward for a distance (dist), in mm
void going_forward(int dist) {
  int enl_target = (dist-bb)/aa;
}

// Turning an angle (dist), in degree
void turning_angle(int angle) {
  ;
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
