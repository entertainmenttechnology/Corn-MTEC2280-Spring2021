Boat[] boats = new Boat[50];

void setup(){
  size(500, 500);
  for(int i=0; i<boats.length; i++){
    boats[i] = new Boat("team " + i, color(int(random(0, 255)),int(random(0, 255)),int(random(0, 255))), 0, int(random(75, 470)), int(random(1,8)));
  }
  rectMode(CENTER);
}

void draw(){
  background(125);
  for(int i=0; i<boats.length; i++){
    boats[i].move();
    boats[i].display();
  }
}


  
  
  
