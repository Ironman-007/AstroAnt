/*
ad5933-test
    Reads impedance values from the AD5933 over I2C and prints them serially.
*/

#include <Wire.h>
#include <SPI.h>
#include "AD5933.h"
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <bluefruit.h>
#include <Adafruit_LittleFS.h>
#include <InternalFileSystem.h>
#include "NRF52TimerInterrupt.h"
#include "NRF52_ISR_Timer.h"

//#define START_FREQ  (1000)
//#define FREQ_INCR   (500)
#define NUM_INCR    (99)
//#define REF_RESIST  (10000)

unsigned long START_FREQ =  1000;
unsigned long FREQ_INCR  =   500;
//int NUM_INCR   =    10;
unsigned long REF_RESIST = 10000;

#define CMD_BYTE_CNT 17

// Pins
// Node

#define SET_PARA_CMD 1
#define CALI_CMD     2
#define SWEEP_CMD    3
#define START_CALI   4
#define START_SWEEP  5
#define SWEEP_DATA   6
#define SWEEP_DONE   7

#define IGNORE_CMD   0

const byte address[6] = "0000F";

const byte sweep_done_ack[CMD_BYTE_CNT] = {0xBB,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA};
const byte sweep_start_ack[CMD_BYTE_CNT] = {0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA};
byte sweep_data_ack[CMD_BYTE_CNT] = {0xEE};

double gain[NUM_INCR+1];
int phase[NUM_INCR+1];

int A=5;
int B=6;
int C=7;

// which antenna
int side_number = 4;

int com_v1 = 4;
int com_v2 = 3;
int com_v3 = 2;

uint8_t cmd_recv[CMD_BYTE_CNT] = {0};
uint8_t ack[CMD_BYTE_CNT] = {0};

int cmd = 0;
int i = 0;

int cali_pin = ;

void setup(void)
{
  pinMode(cali_pin, OUTPUT);

  digitalWrite(cali_pin, HIGH);

  // Begin I2C
  Wire.begin();

  if (!(AD5933::reset() &&
        AD5933::setInternalClock(true) &&
        AD5933::setStartFrequency(START_FREQ) &&
        AD5933::setIncrementFrequency(FREQ_INCR) &&
        AD5933::setNumberIncrements(NUM_INCR) &&
        AD5933::setPGAGain(PGA_GAIN_X1)))
        {
            while (true) ;
        }
}

void loop(void)
{
  if (radio.available()) {
    radio.read(&cmd_recv, CMD_BYTE_CNT);

    cmd = parse_cmd(cmd_recv[0]);

    switch(cmd) {
      case SET_PARA_CMD:
        set_sweep_parameters();
        send_ack(SET_PARA_CMD);
        break;

      case CALI_CMD:
        send_ack(START_CALI);
        initiate_calibration();
        send_ack(CALI_CMD);
        break;

      case SWEEP_CMD:
        send_ack(START_SWEEP);
        frequencySweepEasy();
//        start_sweep();
        send_ack(SWEEP_DONE);
        break;

      default:
//        Serial.println("OTHERS");
        break;
    }
  }
}

void radio_listening() {
  radio.openReadingPipe(0, address);
  radio.startListening();
}

void radio_sending() {
  radio.openWritingPipe(address);
  radio.stopListening();
}

int parse_cmd(byte cmd_id) {
  if (cmd_id == 0xEA)
    return SET_PARA_CMD;
  else if (cmd_id == 0xCA)
    return CALI_CMD;
  else if (cmd_id == 0xEE)
    return SWEEP_CMD;
  else
    return IGNORE_CMD;
}

void set_sweep_parameters() {
  START_FREQ = cmd_recv[1]*pow(256, 3) + cmd_recv[2]*pow(256, 2) + cmd_recv[3]*pow(256, 1) + cmd_recv[4];
  FREQ_INCR =  cmd_recv[5]*pow(256, 3) + cmd_recv[6]*pow(256, 2) + cmd_recv[7]*pow(256, 1) + cmd_recv[8];
  REF_RESIST = cmd_recv[9]*pow(256, 3) + cmd_recv[10]*pow(256, 2) + cmd_recv[11]*pow(256, 1) + cmd_recv[12];

  if (!(AD5933::reset() &&
        AD5933::setInternalClock(true) &&
        AD5933::setStartFrequency(START_FREQ) &&
        AD5933::setIncrementFrequency(FREQ_INCR) &&
        AD5933::setNumberIncrements(NUM_INCR) &&
        AD5933::setPGAGain(PGA_GAIN_X1)))
        {
            while (true) ;
        }
}

void initiate_calibration() {
//  Serial.println("initiate_calibration");
//  delay(2000);
//  Serial.println("calibration done");
  AD5933::calibrate(gain, phase, REF_RESIST, NUM_INCR+1);
}

void start_sweep() {
//  Serial.println("start_sweep");
  delay(5000);
//  Serial.println("sweep done");

  int real[NUM_INCR+1] = {-100, -10, -11, -13, 0, 2, 19991, 90, 1, -10};
  int img[NUM_INCR+1] = {20, 19, 18, 17, 16, 15, 14, -1, -2, -3};
  double magnitude[NUM_INCR+1] = {0.0};

  int iii = 0;

  for (iii = 0; iii < NUM_INCR+1; iii++) {
    // Compute impedance
    magnitude[iii] = sqrt(pow(real[iii], 2) + pow(img[iii], 2));

    byte * real_b = (byte *) &real[iii];
    byte * img_b = (byte *) &img[iii];
    byte * magnitude_b = (byte *) &magnitude[iii];

    memcpy(&sweep_data_ack[1], real_b, 2);
    memcpy(&sweep_data_ack[3], img_b, 2);
    memcpy(&sweep_data_ack[5], magnitude_b, 8);

    send_ack(SWEEP_DATA);

    delay(100);
  }
}

void send_ack(int cmd_type) {
  radio_sending();

  if (cmd_type == SET_PARA_CMD)
    radio.write(&cmd_recv, sizeof(cmd_recv));

  else if (cmd_type == CALI_CMD) {
    cmd_recv[1] = 0xAA;
    radio.write(&cmd_recv, sizeof(cmd_recv));
  }

  else if (cmd_type == START_CALI) {
    cmd_recv[1] = 0x00;
    radio.write(&cmd_recv, sizeof(cmd_recv));
  }

  else if (cmd_type == START_SWEEP) {
    radio.write(&sweep_start_ack, sizeof(sweep_start_ack));
  }

  else if (cmd_type == SWEEP_DATA) {
    radio.write(&sweep_data_ack, sizeof(sweep_data_ack));
  }

  else if (cmd_type == SWEEP_DONE) {
    radio.write(&sweep_done_ack, sizeof(sweep_done_ack));
  }
}

// Easy way to do a frequency sweep. Does an entire frequency sweep at once and
// stores the data into arrays for processing afterwards. This is easy-to-use,
// but doesn't allow you to process data in real time.
void frequencySweepEasy() {

    int iii = 0;
    // Create arrays to hold the data
    int real[NUM_INCR+1], imag[NUM_INCR+1];

    // Perform the frequency sweep
    if (AD5933::frequencySweep(real, imag, NUM_INCR+1)) {
      // Print the frequency data
//      int cfreq = START_FREQ;
//      for (int i = 0; i < NUM_INCR+1; i++, cfreq += FREQ_INCR) {
      for (int iii = 0; iii < NUM_INCR+1; iii++) {
        byte * real_b = (byte *) &real[iii];
        byte * img_b = (byte *) &imag[iii];

        // Compute impedance
        double magnitude = sqrt(pow(real[iii], 2) + pow(imag[iii], 2));
        double impedance = 1/(magnitude*gain[iii]);

        byte * impedance_b = (byte *) &impedance;

        memcpy(&sweep_data_ack[1], real_b, 2);
        memcpy(&sweep_data_ack[3], img_b, 2);
        memcpy(&sweep_data_ack[5], impedance_b, 8); //for nRF52, double is 8 bytes

        send_ack(SWEEP_DATA);

        delay(100);
      }
    }
}