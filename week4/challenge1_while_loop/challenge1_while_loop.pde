/*
///////////////////////////////////////////
 WHILE LOOPS:
 CHALLENGE #1
 ///////////////////////////////////////////
 */

void setup(){
  size(500, 500);
}

void draw(){
    background(255);
    
    int y = 0;
    
    while (y <= width){
      line(y, 0, mouseX, mouseY);
      y+=25;
    }
}
