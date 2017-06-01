import controlP5.*;

PShader fragShader;
ControlP5 cp5;
Slider abc;
circle redC;
circle blueC;
color red = color(228, 49, 139);
color blue = color(0, 167, 234);
float redBValue, blueBValue;
float m = 0.04;
float m2 = 0.1;

float red_rotateValue;
float blue_rotateValue;

//ArrayList<circle> rc;
//ArrayList<circle> bc;

void setup() {
  pixelDensity(2);
  redBValue = 1;
  blueBValue = 1;
  size(800, 800, P2D); 
  fragShader = loadShader("frag.glsl");
  int opacity = 190;
  redC = new circle(380, 30, 0, 4, color(228, 49, 139, opacity), 10);
  blueC = new circle(370, 0, 0, 4, color(0, 167, 234, opacity), 3);

  //cp5 = new ControlP5(this);
  //cp5.addSlider("redBValue")
  //  .setPosition(10, 10)
  //  .setSize(200, 20)
  //  .setRange(-20, 20)
  //  ;

  //cp5.addSlider("blueBValue")
  //  .setPosition(10, 40)
  //  .setSize(200, 20)
  //  .setRange(-9, 9)
  //  ;


  //cp5.addSlider("rotateValue")
  //  .setPosition(10, 70)
  //  .setSize(200, 20)
  //  .setRange(TWO_PI, PI/2)
  //  ;


  // cp5.getController("redBValue").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  // cp5.getController("blueBValue").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
}


void draw() {
  noStroke();
  fill(255, 90);
  rect(0, 0, width, height);
  textAlign(RIGHT, BOTTOM);
  fill(0);
  text(frameRate, width-10, height-10);
  //println("frame Rate is: "+frameRate);


  redBValue += m;
  if (redBValue >=3 || redBValue <= -3) {
    m *= -1;
  }


  blueBValue += m2;
  if (blueBValue >=3 || blueBValue <= -3) {
    m2 *= -1;
  }

  redC.circleBendValue = redBValue;
  blueC.circleBendValue = blueBValue;


  pushMatrix();
  red_rotateValue += 0.007;
  translate(width/2, height/2);
  rotate(red_rotateValue);
  //  scale(1+ 0.001 );
  redC.getCenters();
  redC.updatecircleBendValue();
  redC.show();
  redC.keepQuantity();
  popMatrix();

  pushMatrix();
  blue_rotateValue -= 0.003;

  translate(width/2, height/2);
  rotate(blue_rotateValue) ;
  //  scale(1-0.01);
  blueC.getCenters();
  blueC.updatecircleBendValue();
  blueC.show();
  blueC.keepQuantity();
  popMatrix();
}


void mousePressed() {
  save("screenshot.png");
}