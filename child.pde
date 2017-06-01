class child {
  float diameter = 120;
  float r;
  float xpos, ypos; 
  color myColor; 
  float strokeW = 0.5;
  PVector p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15;
  float warpValue, childBendValue, bendHor; //childBendValue is bendVert


  child (float _xpos, float _ypos, color _myColor, float _childBendValue) {  
    xpos = _xpos;
    ypos = _ypos;
    myColor = _myColor;
    r = diameter/2;
    childBendValue = _childBendValue;
  } 

  void getPoints() {
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

    fragShader.set("p0", p0.x, p0.y);
    fragShader.set("p1", p1.x, p1.y);
    fragShader.set("p2", p2.x, p2.y);
    fragShader.set("p3", p3.x, p3.y); 
    fragShader.set("p4", p4.x, p4.y); 
    fragShader.set("p5", p5.x, p5.y); 
    fragShader.set("p6", p6.x, p6.y); 
    fragShader.set("p7", p7.x, p7.y); 
    fragShader.set("p8", p8.x, p8.y); 
    fragShader.set("p9", p9.x, p9.y); 
    fragShader.set("p10", p10.x, p10.y); 
    fragShader.set("p11", p11.x, p11.y);
    fragShader.set("p12", p12.x, p12.y); 
    fragShader.set("p13", p13.x, p13.y); 
    fragShader.set("p14", p14.x, p14.y);
    fragShader.set("p15", p15.x, p15.y);
    fragShader.set("childBlendValue", childBendValue);
  }


  void show() {
    noFill();
    stroke(myColor);
    strokeWeight(strokeW);

    beginShape();

    for (float i=0; i<1; i+=0.6) {

      curveVertex(
        bendBezier(i, p0.x, p1.x-childBendValue, p2.x, p3.x+pow(childBendValue, 3), p4.x+pow(childBendValue, 3)), 
        bendBezier(i, p0.y-pow(childBendValue, 3), p1.y-pow(childBendValue, 3), p2.y, p3.y+childBendValue, p4.y)
        );

      curveVertex(
        bendBezier(i, p4.x+pow(childBendValue, 3), p5.x+pow(childBendValue, 3), p6.x, p7.x-childBendValue, p8.x-childBendValue), 
        bendBezier(i, p4.y, p5.y-childBendValue, p6.y, p7.y+pow(childBendValue, 3), p8.y+pow(childBendValue, 3))
        );

      curveVertex(
        bendBezier(i, p8.x, p9.x+childBendValue, p10.x, p11.x-pow(childBendValue, 3), p12.x-pow(childBendValue, 3)), 
        bendBezier(i, p8.y+pow(childBendValue, 3), p9.y+pow(childBendValue, 3), p10.y, p11.y-childBendValue, p12.y)
        );

      curveVertex(
        bendBezier(i, p12.x-pow(childBendValue, 3), p13.x-pow(childBendValue, 3), p14.x, p15.x+childBendValue, p0.x+childBendValue), 
        bendBezier(i, p12.y, p13.y+childBendValue, p14.y, p15.y-pow(childBendValue, 3), p0.y-pow(childBendValue, 3))
        );
    }
    endShape();
  }


  float bendBezier(float t, float P0, float P1, float P2, float P3, float P4) {
    float temp = pow((1-t), 4)*P0 + 4*pow((1-t), 3)*t*P1 + 6*pow((1-t), 2)*pow(t, 2)*P2 + 4*(1-t)*pow(t, 3)*P3 + pow(t, 4)*P4; 
    return temp;
  }
} 