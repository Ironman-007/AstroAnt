/*
ad5933-test
    Reads impedance values from the AD5933 over I2C and prints them serially.
*/

#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <SPI.h>
#include <Wire.h>
#include <bluefruit.h>
#include <Adafruit_LittleFS.h>
#include <InternalFileSystem.h>
#include "NRF52TimerInterrupt.h"
#include "NRF52_ISR_Timer.h"
#include "AD5933.h"

#define START_FREQ  (1000)
#define FREQ_INCR   (100)
#define NUM_INCR    (1)
#define REF_RESIST  (20)

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

double gain[NUM_INCR+1];
int phase[NUM_INCR+1];

// the pin used for on-board calibration the AD5933
int cali_pin = 9;

void setup(void)
{
  Serial.begin(115200);
  while(!Serial) delay(10);
  Serial.println("Setting up");

  pinMode(cali_pin, OUTPUT);
  digitalWrite(cali_pin, LOW); // if low, connected with the 20ohm cali resistor.

  // Begin I2C
  Wire.begin();

  // Begin serial at 9600 baud for output
  Serial.begin(9600);
  Serial.println("AD5933 Test Started!");

  // Perform initial configuration. Fail if any one of these fail.
  if (!(AD5933::reset() &&
        AD5933::setInternalClock(true) &&
        AD5933::setStartFrequency(START_FREQ) &&
        AD5933::setIncrementFrequency(FREQ_INCR) &&
        AD5933::setNumberIncrements(NUM_INCR) &&
        AD5933::setPGAGain(PGA_GAIN_X1)))
        {
            Serial.println("FAILED in initialization!");
            while (true) ;
        }

  // Perform calibration sweep
  if (AD5933::calibrate(gain, phase, REF_RESIST, NUM_INCR+1))
    Serial.println("Calibrated!");
  else
    Serial.println("Calibration failed...");

  // ============== Interrupt ==============
  // Interval in microsecs
  ITimer.attachInterruptInterval(HW_TIMER_INTERVAL_MS * 1000, TimerHandler);

  // Just to demonstrate, don't use too many ISR Timers if not absolutely necessary
  // You can use up to 16 timer for each ISR_Timer
  ISR_Timer.setInterval(TIMER_INTERVAL_50ms, timer_handler);
}

byte * magnitude;

void loop(void)
{
  digitalWrite(cali_pin, HIGH);
  // Easy to use method for frequency sweep
  magnitude = frequencySweepEasy();
  /*
  Serial.print(magnitude[0]);
  Serial.print(magnitude[1]);
  Serial.print(magnitude[2]);
  Serial.print(magnitude[3]);
  Serial.print(magnitude[4]);
  Serial.print(magnitude[5]);
  Serial.print(magnitude[6]);
  Serial.println(magnitude[7]);
  */
}

void timer_handler(){
  ;
  /*
  Serial.print(magnitude[0]);
  Serial.print(magnitude[1]);
  Serial.print(magnitude[2]);
  Serial.print(magnitude[3]);
  Serial.print(magnitude[4]);
  Serial.print(magnitude[5]);
  Serial.print(magnitude[6]);
  Serial.println(magnitude[7]);
  */
}

// Easy way to do a frequency sweep. Does an entire frequency sweep at once and
// stores the data into arrays for processing afterwards. This is easy-to-use,
// but doesn't allow you to process data in real time.
byte * frequencySweepEasy() {
    double impedance[2] = {0.0, 0.0};

    // Create arrays to hold the data
    int real[NUM_INCR+1], imag[NUM_INCR+1];

    // Perform the frequency sweep
    if (AD5933::frequencySweep(real, imag, NUM_INCR+1)) {
      // Print the frequency data
      int cfreq = START_FREQ/1000;
      for (int i = 0; i < NUM_INCR+1; i++, cfreq += FREQ_INCR/1000) {
        // Compute impedance
        double magnitude = sqrt(pow(real[i], 2) + pow(imag[i], 2));
        impedance[i] = 1/(magnitude*gain[i]);
      }

      Serial.print("  |Z|=");
      Serial.println(impedance[0]);
      byte * impedance_b = (byte *) &impedance[0];

      return impedance_b;
    }
}

// Removes the frequencySweep abstraction from above. This saves memory and
// allows for data to be processed in real time. However, it's more complex.
void frequencySweepRaw() {
    // Create variables to hold the impedance data and track frequency
    int real, imag, i = 0, cfreq = START_FREQ/1000;

    // Initialize the frequency sweep
    if (!(AD5933::setPowerMode(POWER_STANDBY) &&          // place in standby
          AD5933::setControlMode(CTRL_INIT_START_FREQ) && // init start freq
          AD5933::setControlMode(CTRL_START_FREQ_SWEEP))) // begin frequency sweep
         {
             Serial.println("Could not initialize frequency sweep...");
         }

    // Perform the actual sweep
    while ((AD5933::readStatusRegister() & STATUS_SWEEP_DONE) != STATUS_SWEEP_DONE) {
        // Get the frequency data for this frequency point
        if (!AD5933::getComplexData(&real, &imag)) {
            Serial.println("Could not get raw frequency data...");
        }

        // Print out the frequency data
        Serial.print(cfreq);
        Serial.print(": R=");
        Serial.print(real);
        Serial.print("/I=");
        Serial.print(imag);

        // Compute impedance
        double magnitude = sqrt(pow(real, 2) + pow(imag, 2));
        double impedance = 1/(magnitude*gain[i]);
        Serial.print("  |Z|=");
        Serial.println(impedance);

        // Increment the frequency
        i++;
        cfreq += FREQ_INCR/1000;
        AD5933::setControlMode(CTRL_INCREMENT_FREQ);
    }

    Serial.println("Frequency sweep complete!");

    // Set AD5933 power mode to standby when finished
    if (!AD5933::setPowerMode(POWER_STANDBY))
        Serial.println("Could not set to standby...");
}