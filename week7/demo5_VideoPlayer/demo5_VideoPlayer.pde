import processing.video.*;
Movie file;

void setup() {
  size(200, 200);
  file = new Movie(this, "totoro.mov");
  file.loop();
}

void draw() {
  tint(255, 20);
  image(file, mouseX, mouseY);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
