#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif
varying vec4 vertColor;
attribute vec4 position;
uniform vec2 p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15;
uniform float childBlendValue;


void main() {
    
    gl_FragColor = vertColor;
}
