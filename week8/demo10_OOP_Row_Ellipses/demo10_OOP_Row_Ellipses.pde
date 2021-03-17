/*
Sets up a row of 5 ellipses.
When hovering mouse over ellipse, each one fades and falls.
*/


Hover[] hover= new Hover [5]; //declare object array

void setup() {
  size (500, 500);
  //initialize each object by calling constructor
  for (int i=0; i<hover.length; i++) {   
    hover[i]= new Hover(i*100+50, 100); //pass ellipse x,y position into each object
  }
}

void draw() {
  size (500, 500);
  background(255);
  for (int i=0; i<hover.length; i++) {
    hover[i].display();
    hover[i].fall();
  }
}

class Hover {
  //instance variables
  float x;
  float y;
  int dist=50;
  int fade=0;
  float drop=0;
  boolean goFall=false; 

  //constructor
  Hover(float tempX, float tempY) {
    x= tempX; 
    y= tempY;
  }

  void display() {
    fill(fade);
    ellipse (x, y+drop, dist, dist);
  }

  void fall() {
    if (mouseX>x-dist/2 && mouseX<x+dist/2 && mouseY>y-dist/2 && mouseY< y+dist/2) {
      goFall=true;
    } 
    if (goFall==true) {
      if (fade<255) {
        fade++;
      }
      if (drop<height+dist) {
        drop++;
      }
    }
  }
}
