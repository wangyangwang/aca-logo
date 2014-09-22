// child c1;
// color c = color(255, 255, 255);
circle c1;

void setup() {
  smooth();
  size(600, 600, "processing.core.PGraphicsRetina2D"); 
  c1 = new circle(width/2, width/2, height/2, 300);
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  c1.getCenters();
  c1.show();
  c1.keepQuantity();
  popMatrix();
}

