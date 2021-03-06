// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(6, OUTPUT);
  pinMode(11, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  analogWrite(6, 255);   // turn the LED on (HIGH is the voltage level)
  analogWrite(11, 0);    // turn the LED off by making the voltage LOW
}
