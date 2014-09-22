class child {
  float diameter = 100;
  float xpos, ypos; 
  color myColor; 
  float strokeW = 0.2;

  child (float _xpos, float _ypos, color _myColor) {  
    xpos = _xpos;
    ypos = _ypos;
    myColor = _myColor;
  } 

  void show() { 
    noFill();
    stroke(myColor);
    strokeWeight(strokeW);
    ellipse(xpos, ypos, diameter, diameter);
  }
} 

