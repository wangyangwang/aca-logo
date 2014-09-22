class circle {
  float xpos, ypos;
  float diameter;
  PVector[] centers;
  child[] children;
  color c;
  int childrenQuantity;

  circle ( float _diameter, float _xpos, float _ypos, int _childrenQuantity, color _c ) {
    xpos = _xpos;
    ypos = _ypos;
    diameter = _diameter;
    childrenQuantity = _childrenQuantity;
    centers = new PVector[childrenQuantity];
    children = new child[childrenQuantity];
    c = _c;
  }

  void getCenters() {
    float gap = TWO_PI / childrenQuantity;
    int count = 0;
    for (float i = 0; i < TWO_PI; i+=gap) {
      centers[count] = new PVector(sin(i) * diameter/2, cos(i) * diameter/2);
      count++;
    }
  }

  void show() {
    for ( int i=0; i < children.length; i++) {
      noFill();
      stroke(c);
      strokeWeight(0.1);
      children[i] = new child(centers[i].x, centers[i].y, c);
      children[i].show();
    }    
  }


  void keepQuantity() {

  }
}

