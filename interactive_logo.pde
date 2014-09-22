// child c1;
// color c = color(255, 255, 255);
circle c1;
color d = color(255, 0, 255);

void setup() {
  smooth();
  size(600, 600, "processing.core.PGraphicsRetina2D"); 
  c1 = new circle(width/2, width/2, height/2, 300, d );
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

