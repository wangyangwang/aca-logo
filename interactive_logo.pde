PVector v1;
child h1;
color c = color(255, 255, 255);

void setup() {
  smooth();
  size(600,600,"processing.core.PGraphicsRetina2D");
  v1 = new PVector(mouseX,mouseY);
  h1 = new child(v1,c,500);
}

void draw() {
  h1.center = new PVector(mouseX,mouseY);
  background(0);
  h1.show();
}

