
void createControlService(void) {
  uint8_t controlServiceUUID[16]   = {0x04,0xaa,0x00,0x00,0x00,0x00,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b}; //"0b0b0b0b-0b0b-0b0b-0b0b-00000000aa04"
  uint8_t chrCommandUUID[16]       = {0x04,0xaa,0x00,0x00,0x00,0xc1,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b}; //"0b0b0b0b-0b0b-0b0b-0b0b-c1000000aa04"
  uint8_t chrHardwareStateUUID[16]= {0x04,0xaa,0x00,0x00,0x00,0xc2,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b,0x0b}; //"0b0b0b0b-0b0b-0b0b-0b0b-c2000000aa04"

  controlService = BLEService(controlServiceUUID);
  controlService.begin();

  chrCommand = BLECharacteristic(chrCommandUUID);
  chrCommand.setProperties(CHR_PROPS_WRITE);
  chrCommand.setWriteCallback(onWrite_chrCommand);
  chrCommand.setPermission(SECMODE_OPEN, SECMODE_OPEN);
  chrCommand.setFixedLen(3);
  chrCommand.begin();

  chrHardwareState = BLECharacteristic(chrHardwareStateUUID);
  chrHardwareState.setProperties(CHR_PROPS_NOTIFY | CHR_PROPS_READ);
  chrHardwareState.setPermission(SECMODE_OPEN, SECMODE_OPEN);
  chrHardwareState.setFixedLen(2);
  chrHardwareState.begin();
  chrHardwareState.write16(flowio.getHardwareState());
}

//This is executed when a central device writes to the characteristic.
void onWrite_chrCommand(uint16_t conn_hdl, BLECharacteristic* chr, uint8_t* data, uint16_t len) {
  Serial.println("Value Written");  
  //data[0]=action, data[1]=port, data[2]=pwm
  if(len==2){
    Serial.print(data[0],BIN);
    Serial.println(data[1],BIN);
    flowio.command(data[0],data[1]);
  }
  else if(len==3){ //TODO: I need to know which byte is what.
    Serial.print(data[0],BIN);
    Serial.println(data[1],BIN);
    Serial.println(data[2],BIN);
    flowio.command(data[0],data[1],data[2]);
  }
  chrHardwareState.notify16(flowio.getHardwareState());
}
