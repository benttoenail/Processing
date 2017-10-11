// Author:
// Title:

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI 3.14159265359
#define TWO_PI 6.28318530718

//ROTATION FUNCTION
mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
    sin(_angle),cos(_angle));
}

//CIRCLE SHAPE
float circle(vec2 _st, vec2 _pos, float _radius, float _thick){
    vec2 center = _st+_pos - vec2(0.5);
    _thick *= 0.01;
    return step(length(center), 0.5*_radius) - 
        	step(length(center),(0.49+_thick)*_radius);
}

//Fade Circle Shape
float fadeCircle(in vec2 _st, in float _radius, vec2 _center){
    vec2 d = _st - vec2(_center);
    float c1 = 1.-smoothstep(_radius-(_radius*-0.476),//Inner Circle
                        _radius +(_radius*-0.228),
                        dot(d, d)*4.0);
    float c2 = 1.-smoothstep(_radius-(_radius*-0.37),//Outer Circle
                        _radius +(_radius*0.36),
                        dot(d, d)*4.0);
    
    float incs = circle(_st, d, 0.175, -4.0);
    float circle = c1-c2 + incs;
    return circle;
}



//BOX FOR CROSS
float box(in vec2 _st, in vec2 _size){
    _size = vec2(0.5) - _size*0.5;
    vec2 uv = smoothstep(_size,
                        _size+vec2(0.001),
                        _st);
    uv *= smoothstep(_size,
                    _size+vec2(0.001),
                    vec2(1.0)-_st);
    return uv.x*uv.y;
}

//CROSS SHAPE
float cross(in vec2 _st, float _size){
    return  box(_st, vec2(_size,_size/200.)) +
            box(_st, vec2(_size/200.,_size));
}

//DRAW ALL CIRCLES
float RadarCircles(vec2 _st){
    float cut = box(_st, vec2(2.0,0.050));//Box to cut out shape - not working...
    
    float c1 = circle(_st, vec2(0.0), 1.0, 0.5);
    float c2 = circle(_st, vec2(0.0), 0.75, 0.5)*0.75;
    float c3 = circle(_st, vec2(0.0), 0.5, 0.5)*0.5;
    float c4 = circle(_st, vec2(0.0), 0.25, 0.5)*0.25;
    float c5 = circle(_st, vec2(0.0), 0.05, 0.0)*0.4;
    float radar = (c1+c2+c3+c4+c5);
    return radar;
}

//DRAW ENTIRE RADAR
vec3 DrawRadar(vec2 _st){
    float rc = RadarCircles(_st);
    
    _st -= vec2(0.5);
    _st = rotate2d(90.33)*_st;
    _st += vec2(0.5);
    float c = cross(_st, 0.75);
    float fc = fadeCircle(_st, 0.2, vec2(0.5));
    
    vec3 color = vec3(rc+c*0.3, rc+c*0.3+fc, rc+c*0.3);
    return  color;
}

void main() {
    vec2 st = gl_FragCoord.xy / u_resolution;
	vec3 c = vec3(0.0);
    
    vec2 center = st - vec2(0.5);
    float d = step(length(center), 0.5);
    
    c = DrawRadar(st);
    
    gl_FragColor = vec4(c, 1.0);
}






