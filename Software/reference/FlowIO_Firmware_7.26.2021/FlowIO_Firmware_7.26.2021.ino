#include <bluefruit.h>
#include <FlowIO.h>

#define DEVICE_NAME "FlowIO_CtrPwrCfgIndBatPrs"// Device Name: Maximum 30 bytes

FlowIO flowio;
uint16_t hardwareStatePrevious; //we'll use this to decite when to restart the power off timer, in the main loop below.
uint8_t _holdPWM=150; //valve holding voltage. We must maintain the holding voltage at 1.3V. But as the battery
  //voltage drops, so does the voltage at the valve. Thus, we must increase the PWM value to counteract the drop
  //in battery voltage. Hence, the battery service updates the value periodically. 
  //This variable is used in the argument of the .optimizePower() function below.
//#################---Define Service and Characteristic Names---####################
BLEService controlService;
  BLECharacteristic chrCommand;
  BLECharacteristic chrHardwareState;
  uint8_t cmd[3]; //holds the command. cmd[0]=action, cmd[1]=port, cmd[2]=pwm.
BLEService powerOffService;
  BLECharacteristic chrPowerOffTimer;
BLEService configService;
  BLECharacteristic chrConfig;
BLEService indicatorService;
  BLECharacteristic chrLedStates;
  BLECharacteristic chrError;
  uint8_t ledStates[2];
BLEService batteryService;
  BLECharacteristic chrBattPercentage;
BLEService pressureService;
  BLECharacteristic chrPressureValue;
  BLECharacteristic chrPressureRequest;
  BLECharacteristic chrMaxPressureLimits;
  BLECharacteristic chrMinPressureLimits;
  //Define 2 arrays to hold our pressure limits, which will update whenever the limits are changed
  //from the GUI. Based on these values, we will decide whether to allow an action to take place.
  float minLimits[5];
  float maxLimits[5];
//##################################################################################

void setup() {
  flowio = FlowIO(GENERAL); //This must be done the very first item to minimize the click on startup (Bug #44 on Github)  
  //NOTE: You cannot do the object initialization together with the declaration, because it will cause the 
  //hardware to not work fine, even though it will compile fine.
  analogReference(AR_INTERNAL_3_0);   // Set the analog reference to 3.0V (default = 3.6V) b/c battery voltage may drop to <3.6V and then default will become inaccurate.
  analogReadResolution(12);   // Set the resolution to 12-bit (0..4095). Can be 8, 10, 12 or 14
  Serial.begin(115200);

  if(flowio.activateSensor()==false){
    flowio.pixel(1,0,0);
    //error 222 is automatically created by the API
  }
  Bluefruit.autoConnLed(true);   // Setup the BLE LED to be enabled on CONNECT. Do I need this?
  //All Bluefruit.config***() function must be called before Bluefruit.begin()
  Bluefruit.configPrphBandwidth(BANDWIDTH_MAX); // Config the peripheral connection with maximum bandwidth. Do I need this?
  Bluefruit.configUuid128Count(15); //by default this is 10, and we have more than 10 services & characteristics on FlowIO
  Bluefruit.begin();
  Bluefruit.setTxPower(8);
  // Supported tx_power values depending on mcu:
    // - nRF52832: -40dBm, -20dBm, -16dBm, -12dBm, -8dBm, -4dBm, 0dBm, +3dBm and +4dBm.
    // - nRF52840: -40dBm, -20dBm, -16dBm, -12dBm, -8dBm, -4dBm, 0dBm, +2dBm, +3dBm, +4dBm, +5dBm, +6dBm, +7dBm and +8dBm.
  Bluefruit.setName(DEVICE_NAME);
  Bluefruit.Periph.setConnectCallback(connect_callback);
  Bluefruit.Periph.setDisconnectCallback(disconnect_callback);

  //#####################---Create Services---####################
  createControlService(); //this is defined in "controlService.ino"
  createPowerOffService(); //This is defined in the file "powerService.ino"
  createConfigService(); //This is defined in "configService.ino"
  createIndicatorService();
  createBatteryService(); //this is defined in "batteryService.ino"
  createPressureService();
  //##############################################################

  startAdvertising();  

  hardwareStatePrevious = flowio.getHardwareState();
  flowio.pixel(5,5,5);
}

void startAdvertising(void) {
  Bluefruit.Advertising.addFlags(BLE_GAP_ADV_FLAGS_LE_ONLY_GENERAL_DISC_MODE);
  Bluefruit.Advertising.addTxPower();
  Bluefruit.ScanResponse.addName();
  Bluefruit.Advertising.restartOnDisconnect(true);
      //Choose which services we want to advertise. No need to advertise all custom services
  Bluefruit.Advertising.addService(controlService); //advertise service uuic
  Bluefruit.Advertising.addService(powerOffService); //advertise service uuid
  Bluefruit.Advertising.addService(configService); //advertise service uuic
  Bluefruit.Advertising.addService(indicatorService); //advertise service uuic
  Bluefruit.Advertising.addService(batteryService);   //advertise service uuid
  Bluefruit.Advertising.addService(pressureService); //advertise service uuic

  Bluefruit.Advertising.setInterval(32, 244); // in unit of 0.625 ms
  Bluefruit.Advertising.setFastTimeout(30);   // number of seconds in fast mode

  Bluefruit.Advertising.start(0);
}

void loop() {
  //if an error has occurred, report the error by setting the characteristic value to the error code.
  //TODO: Update the library so that it itself can raise error codes. Then you would be checking if there is an 
  //error with the function flowio.iferror() 
  if(flowio.readError()>0 && Bluefruit.connected()){
    Serial.println("There is an Error");
    chrError.notify8(flowio.readError());
    flowio.raiseError(0); //clear the error. (However, this does NOT clear the error from the characteristic!) 
  }
  //Check if there is a change in hardware state, and if yes - restart the off timer.
  if(flowio.getHardwareState() != hardwareStatePrevious){
    restartOffTimer();
    hardwareStatePrevious = flowio.getHardwareState();
  }

  checkIfTimeToPowerOffEvery(5000); //Even though we are calling this function every time
  //we go through this loop, the contents of the function actually execute only every 5 sec.
  //There is a clever algorightm in it that checks if 5 sec has passed.
  updateBatteryLevelEvery(5000);
  notifyPressure_IfActive_IfDeltaP(0.005); //Sends a pressure notification if device is running and if pressure has changed
  //by more than the PSI value specified in the argument. This checks the status byte to determine if device is running.
  flowio.optimizePower(_holdPWM,200); //second argument can be fine tuned better to be lower.
}

void connect_callback(uint16_t conn_handle){
  resetOffTimer(); //reset the timer to 5 minutes.
  //stop everything on connect
  Serial.println("Connected");
  cmd[0] = '!';
  cmd[1] = 0b00011111;
  cmd[3] = 0; //this is irrelevant for '!'. But we are sending the full cmd array anyways to BLE.
  flowio.command(cmd[0],cmd[1]);
  //You can replace the above 3 lines with: flowio.stopAction(0x00011111);
  chrCommand.write(cmd,3); //We are writing the full 3-byte cmd array. 
  chrHardwareState.notify16(flowio.getHardwareState());
  chrConfig.notify8(flowio.getConfig());  
  ledStates[0] = 0x00;
  ledStates[1] = 0x01;
  flowio.pixel(ledStates[0],0,0);
  flowio.blueLED(ledStates[1]);
  chrLedStates.notify(ledStates,2);
  if(flowio.readError()>0); chrError.write8(flowio.readError()); //Anything sent as a notification upon connect will not
  //be received, becasue the client first needs to notify the peripheral that it accepts notifications,
  //and upon connect that hasn't happened yet, so the peripheral doesn't send the notification.
  //Thus it only makes sense to use write() rather than notify() in this callback.
  chrBattPercentage.notify8(getBatteryPercentage());
  float num = flowio.getPressure(PSI);
  chrPressureValue.notify(&num,sizeof(num));
}
void disconnect_callback(uint16_t conn_handle, uint8_t reason){
  restartOffTimer(); //we RESTART the timer to whatever value the user had previsouly chosen in the GUI.  
  //stop everything on disconnect
  cmd[0] = '!'; //stop 
  cmd[1] = 0b00011111; //all
  flowio.command(cmd[0],cmd[1]);
  //You can replace the above 3 lines with flowio.stopAction(0x00011111);
  //but leave them like this for clarity of how the protocol can be used.
  ledStates[0] = 0x00;
  ledStates[1] = 0x00;
  chrLedStates.write(ledStates,sizeof(ledStates));
  flowio.pixel(ledStates[0],0,0);
}
