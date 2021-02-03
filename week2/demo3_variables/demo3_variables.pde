demo3_variables
/*
///////////////////////////////////////////
 PLAYING WITH VARIABLES
 From demo exploring: 
 variables and data types, arithmetic 
 ///////////////////////////////////////////
 */

int number=5; //declares an integer variable called number and assigns a value of 5
float grow=0.5; //declares a float variable called grow and assigns a value of 0.5
float move; //declares 



void setup() {
  size (800, 800);
  move = 0.2; //initializes
}


void draw() {
  background (255);

  //uses variable and arithmetic for ellipse values
  ellipse (mouseX, mouseY, 100 * number, 100/number);

  //creates a rectangle using grow variable for width and height
  rect (mouseX-50, mouseY-50, grow, grow);
  //increments grow variable by 0.2, value updates at end of each draw
  grow= grow + .2;

  //creates a rectangle using move variable for X position
  rect(move, 400, 100, 100);
  //increments move variable
  move= move+0.2;

  (see keynote here)

  //prints values variables to the console

  print("here is some text");
  
  println ("number:  " + number);
  println ("grow:  " + grow);
  println ("move:  " + move);
}
