class child {
  float diameter;
  PVector center; 
  color mycolor; 
  
  child (PVector _center, color _mycolor, float _diameter) {  
    center = _center;
    mycolor = _mycolor;
    diameter = _diameter;
  } 

  void show() { 
    noFill();
    stroke(mycolor);
    strokeWeight(1);
    ellipse(center.x,center.y,diameter,diameter);  
  }
} 

