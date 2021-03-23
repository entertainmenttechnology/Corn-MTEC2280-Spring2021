int[] pointX = new int[50];
int[] pointY = new int[50];

int counter = 0;

void setup(){
  size(500, 500);
}

void draw(){
  background(255);
  pointX[counter] = mouseX;
  pointY[counter] = mouseY;
  counter++;
  
  for(int i=0; i<pointX.length-1; i++){
    if(i+1 != counter){
      line(pointX[i], pointY[i], pointX[i+1], pointY[i+1]);
    }
  }
  
  if (counter != pointX.length){
    line(pointX[0], pointY[0], pointX[pointX.length-1], pointY[pointX.length-1]);
  }
  
  
  if (counter > pointX.length-1){
    counter = 0;
  }
}
