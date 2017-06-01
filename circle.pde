class circle {
  float xpos, ypos;
  float diameter, r;

  ArrayList<PVector> centers_one;
  ArrayList<PVector> centers_two;
  ArrayList<PVector> centers_three;
  ArrayList<PVector> centers_four;

  ArrayList<child> children;
  color c;
  int childrenQuantity;
  float v;
  float thre = 5;  
  PVector p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15;
  float circleBendValue; //circleBendValue is bendVert


  circle ( float _diameter, float _xpos, float _ypos, int _childrenQuantity, color _c, float _circleBendValue ) {
    xpos = _xpos;
    ypos = _ypos;
    diameter = _diameter;
    r = diameter/2;
    childrenQuantity = _childrenQuantity;
    centers_one = new ArrayList<PVector>();
    centers_two = new ArrayList<PVector>();
    centers_three = new ArrayList<PVector>();
    centers_four = new ArrayList<PVector>();

    children = new ArrayList<child>();
    c = _c;
    circleBendValue = _circleBendValue;
  }


  void getCenters() {

    p0 = new PVector( xpos, ypos-r);
    p1 = new PVector( xpos + r*cos(PI*9/20), ypos - r*sin(PI*9/20));
    p2 = new PVector ( xpos + r, ypos - r);
    p3 = new PVector ( xpos + r*cos(PI/20), ypos - r*sin(PI/20));
    p4 = new PVector ( xpos+r, ypos);
    p5 = new PVector ( xpos + r*cos(PI*1/20), ypos + r*sin(PI*1/20));
    p6 = new PVector ( xpos + r, xpos + r);
    p7 = new PVector ( xpos + r*sin(PI/20), ypos + r*cos(PI/20));
    p8 = new PVector ( xpos, ypos+r);
    p9 = new PVector ( xpos - r*sin(PI/20), ypos + r*cos(PI/20));
    p10 = new PVector ( xpos - r, ypos + r);
    p11 = new PVector ( xpos - r*cos(PI/20), ypos + r*sin(PI/20));
    p12 = new PVector ( xpos - r, ypos);
    p13 = new PVector ( xpos - r*cos(PI/20), ypos - r*sin(PI/20));
    p14 = new PVector ( xpos - r, ypos-r);
    p15 = new PVector ( xpos - r*sin(PI/20), ypos - r*cos(PI/20));


    float step = 1/ (childrenQuantity);

    for (float i=0; i <1; i+=0.01) {
      centers_one.add(new PVector(bendBezier(i, p0.x, p1.x-circleBendValue, p2.x, p3.x+pow(circleBendValue, 3), p4.x+pow(circleBendValue, 3)), bendBezier(i, p0.y-pow(circleBendValue, 3), p1.y-pow(circleBendValue, 3), p2.y, p3.y+circleBendValue, p4.y)));
      centers_two.add(new PVector(bendBezier(i, p4.x+pow(circleBendValue, 3), p5.x+pow(circleBendValue, 3), p6.x, p7.x-circleBendValue, p8.x-circleBendValue), bendBezier(i, p4.y, p5.y-circleBendValue, p6.y, p7.y+pow(circleBendValue, 3), p8.y+pow(circleBendValue, 3))));
      centers_three.add(new PVector(bendBezier(i, p8.x, p9.x+circleBendValue, p10.x, p11.x-pow(circleBendValue, 3), p12.x-pow(circleBendValue, 3)), bendBezier(i, p8.y+pow(circleBendValue, 3), p9.y+pow(circleBendValue, 3), p10.y, p11.y-circleBendValue, p12.y)));
      centers_four.add(new PVector(bendBezier(i, p12.x-pow(circleBendValue, 3), p13.x-pow(circleBendValue, 3), p14.x, p15.x+circleBendValue, p0.x+circleBendValue), bendBezier(i, p12.y, p13.y+circleBendValue, p14.y, p15.y-pow(circleBendValue, 3), p0.y-pow(circleBendValue, 3))));
    }
  }



  void updatecircleBendValue() {
  }




  void show() {
    float childBendValue = 0;
    float incre = 0.001;
    for ( int i=0; i<centers_one.size (); i++) {
      children.add(new child(centers_one.get(i).x, centers_one.get(i).y, c, childBendValue));
      childBendValue += incre;
    }
    for ( int i=0; i<centers_two.size (); i++) {
      children.add(new child(centers_two.get(i).x, centers_two.get(i).y, c, childBendValue));
      childBendValue += incre;
    }
    for ( int i=0; i<centers_three.size (); i++) {
      children.add(new child(centers_three.get(i).x, centers_three.get(i).y, c, childBendValue));
      childBendValue += incre;
    }
    for ( int i=0; i<centers_four.size (); i++) {
      children.add(new child(centers_four.get(i).x, centers_four.get(i).y, c, childBendValue));
      childBendValue += incre;
    }


    for ( int i=0; i<children.size (); i++) {
      children.get(i).getPoints();
      children.get(i).show();
    }
  }

  void keepQuantity() {
    centers_one.clear();
    centers_two.clear();
    centers_three.clear();
    centers_four.clear();
    children.clear();
  }




  float bendBezier(float t, float P0, float P1, float P2, float P3, float P4) {
    float temp = pow((1-t), 4)*P0 + 4*pow((1-t), 3)*t*P1 + 6*pow((1-t), 2)*pow(t, 2)*P2 + 4*(1-t)*pow(t, 3)*P3 + pow(t, 4)*P4; 
    return temp;
  }
}