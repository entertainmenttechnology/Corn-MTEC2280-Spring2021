const int BUTTON = 2;
const int LED1 = 8;
const int LED2 = 7;

//Tracking values
int buttonState = LOW; // tracks current state of button
int lastButtonState = LOW;  // tracks previous state of button
int buttonCount = 0; // tracks number of times button has been toggled
 
// incoming serial byte
int inByte = 0;       

void setup() {
  Serial.begin(9600);  // start serial communication:
  while (!Serial) {  //if serial not connected
    ;   // wait for serial port to connect. 
  }

  //set pins as inputs
  pinMode(BUTTON, INPUT);  
  pinMode(LED1, OUTPUT);  
  pinMode(LED2, OUTPUT); 

  establishContact();  // send a byte to establish contact until receiver responds
}

void loop() {
    buttonState = digitalRead(BUTTON);
    if (buttonState == HIGH && lastButtonState == LOW){
      buttonCount++;
    }
    else{}
    lastButtonState = buttonState;
    
    if (buttonCount > 255){
      buttonCount = 0;
    }
    delay(10);
    
  // if we get a valid byte, read sensor inputs:
  if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();

    //if we have received a state of 0, turn off LEDs
    if(inByte == 0){
      digitalWrite(LED1, LOW);
      digitalWrite(LED2, LOW);
    }
    else if(inByte == 1){ //if we have received a state of 1, turn on LED1
      digitalWrite(LED1, HIGH);
      digitalWrite(LED2, LOW);
    }
    else if(inByte == 2){ //if we have received a state of 2, turn on LED2
      digitalWrite(LED1, LOW);
      digitalWrite(LED2, HIGH);
    }
    else{}
    
    //send buttonCount to Serial port:
    Serial.write(buttonCount);
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.print('A');   // send a capital A
    delay(300);
  }
}
