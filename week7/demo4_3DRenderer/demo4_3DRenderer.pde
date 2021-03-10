float x,y,z;
float increment = 0.01;
float value = 0;

void setup() {
  size(200,200,P3D);
  x = width/2;
  y = height/2;
  z = 0;
}

void draw() {
  background(0);
  translate(x,y,z);
  rotateX(value);
  rotateY(value);
  rotateZ(value);
  rectMode(CENTER);
  rect(0,0,50,50);

  value+= increment;
  z += increment*20;
}
