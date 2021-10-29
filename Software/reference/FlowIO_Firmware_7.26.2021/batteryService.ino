//battery percentage (https://learn.adafruit.com/bluefruit-nrf52-feather-learning-guide/nrf52-adc)
#define VBAT_PIN          A6            //A7 for nrf52832, A6 for nrf52840
#define VBAT_RESOLUTION   0.73242188F   //For 12bit @ 3V reference, resolution is 3000mV/4096steps = 0.732421875mV/step.

uint8_t batteryPercentage = 0; 
uint8_t batteryPercentageOld = 0; 
int lastTime = millis();

float getVBAT_mV() { //keep this as float, because we have adivision in the invoking function below.
  //Vbat(ADC) = ADC*(3000mV/4096steps)*(R1+R2)/R2. 
  //For nrf52830: R1=806k, R2=2000k;  (R1+R2)/R2 = 1.403
  //For nrf52840: R1=100k, R2=100k;   (R1+R2)/R2 = 2
  float vbat_mv = analogRead(VBAT_PIN) * VBAT_RESOLUTION * 2; //we multiply the read value times the millivols per step.
  //The read value is half the battery voltage because it's b/n 2 identical resistors. Thus we multiple by 2 to get the
  //voltage at the battery.
  
  //############---Optimize the _holdPWM Value---##################
  //This is a global variable defined in the main file.
  //  if(vbat_mV>3700) _holdPWM=170;
  //  if(vbat_mV<=3700 && vbat_mv>3500) _holdPWM=180;
  //  if(vbat_mV<=3500 && vbat_mv>3300) _holdPWM=190;
  //  if(vbat_mV<3100) _holdPWM = 255;
  //#############################################################

  //############---Indicate when the Battery is below 3.2V---##################
  //  if(vbat_mv<=3200) flowio.pixel(1,0,0);
  //  else flowio.pixel(0,0,0);
  //TODO: This is not ideal because I want to just restore the pixel LED to it's previous state when the battery
  //level goes above the 3.2V limit; I don't want to power off the Pixel LED if it wasn't powered off beforehand.
  //The neopixel library may already have a function that keeps track of the previous state. If so, then just
  //add that function into the FlowIO library too.
  //TODO: I want this indicator to also work in the disconnected state. Currently it gets invoked only if BLE is connected.
  //TODO: The power saving features also work only if the battery service is present. I should just add the battery sensing features
  //directly into the FlowIO API, rather than having it be part of the firmware. Because people will be writing their own code for
  //FlowIO quite often, and the optimizePower function should just do everthing for them - without them having to implement a 
  //complete battery voltage measurement procedure themselves. 
  //TODO: Additionally, right now, the LED goes from RED to off not as soon as I remove the load, but after 5 seconds, which is 
  //very confusing for the user experience.
  //#############################################################

  return vbat_mv; 
}

uint8_t getBatteryPercentage(){ //this computation is based on LiPo chemistry.
  float mv = getVBAT_mV();
  if(mv<3300) return 0;
  if(mv<3600) return (mv-3300)/30;
  mv = mv-3600;
  return 10 + (mv * 0.15F );  // thats mv/6.66666666
}

void updateBatteryLevelEvery(int interval){
  if(Bluefruit.connected()){ //This is mandatory here becasue we cannot execute .notify8() unless connected.
    if(millis() - lastTime > interval){ //we wiil check the battery only once per 5 seconds. This reduces power consumption greatly.
      Serial.println("Read Battery Value");
      batteryPercentage = getBatteryPercentage();
      Serial.println(batteryPercentage);
      lastTime = millis();
      if(batteryPercentage < batteryPercentageOld-1 || batteryPercentage > batteryPercentageOld+1) {
        if(batteryPercentage < 10)  chrBattPercentage.notify8(batteryPercentage);
        else                        chrBattPercentage.write8(batteryPercentage);
        batteryPercentageOld = batteryPercentage;
      }
    }
  }
}

void createBatteryService(){
  batteryService = BLEService(0x180F);
  batteryService.begin();

  chrBattPercentage = BLECharacteristic(0x2A19);
  chrBattPercentage.setProperties(CHR_PROPS_READ | CHR_PROPS_NOTIFY);
  chrBattPercentage.setFixedLen(1);
  chrBattPercentage.setPermission(SECMODE_OPEN, SECMODE_NO_ACCESS);
    //For the permission, the first parameter is the READ, second the WRITE permission
  chrBattPercentage.begin();
}
