import processing.serial.*; //import serial library

Serial myPort;         // create serial object

boolean firstContact = false;        // Whether we're receiving data
int lastByte = -1;
int state = 0;
color bgcolor = color(0, 0, 0);

void setup() {
  size(500, 500);     

  // Print a list of the serial ports for debugging purposes
  printArray(Serial.list());

  // Check console and change [port] to open whatever port you're using.
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);  // assign port at specified communication rate
}

void draw() {
  background(bgcolor);
  
  if(myPort.available() > 0){
    int inByte = myPort.read();
    
    if (firstContact == false) {
      if (inByte == 'A') {
        myPort.clear();          // clear the serial port buffer
        firstContact = true;     // you've had first contact from the microcontroller
        myPort.write(0);       // ask for more
      }
    }
    else{
      if(lastByte != inByte){ // if we received a byte from the Arduino that doesn't match our last byte
        lastByte = inByte;
        state++; // increase the state
      }
      
      if(state > 2){
        state = 0; // if state is greater than 2, set it back to 0
      }
      
      if(state == 0){
        bgcolor = color(0, 0, 0); // black background
      }
      else if(state == 1){
        bgcolor = color(0, 0, 255); // blue background, set color to match LED1
      }
      else if(state == 2){
        bgcolor = color(0, 255, 0); // green background, set color to match LED2
      }
    }
    myPort.write(state); // send state back to Arduino
  }
}
