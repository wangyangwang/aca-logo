class circle {
  float xpos, ypos;
  float diameter;
  PVector[] centers;
  // ArrayList<child> children;
  int childrenQuantity;

  circle ( float _diameter, float _xpos, float _ypos, int _childrenQuantity ) {
    xpos = _xpos;
    ypos = _ypos;
    diameter = _diameter;
    childrenQuantity = _childrenQuantity;
    centers = new PVector[childrenQuantity];
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
    for ( int i=0; i<centers.length; i++) {
      noFill();
      stroke(0);
      strokeWeight(0.1);
      ellipse(centers[i].x, centers[i].y, 40, 40);
    }    
  }


  void keepQuantity() {
    println(centers.length);
  }
}

