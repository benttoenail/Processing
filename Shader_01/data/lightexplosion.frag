// Author:
// Title:

#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 flower(vec2 _st, float _r, float _numsides, vec2 _pos){
    float t = u_time ;
    t = abs(cos(t*0.1)*1.7);
    
    vec2 pos = vec2(_pos)-_st;
    float r = length(pos)*_r;
    
    float a = atan(pos.y, pos.x);
    float f = cos(a * _numsides);
    f = abs(cos(a*_numsides));
    //f = fract(cos(a*_numsides)*sin(a*_numsides))*0.7;
    f = smoothstep(-0.5, 1.0, cos(a*20.0))*0.00+(0.0+t);
    
    float s = 1.0 - smoothstep(f, f+ (t*0.8), r) -
               smoothstep(f, f-0.314, r);
    
    return vec3(s, f, f)/r ;
}


void main() {
	vec2 st = gl_FragCoord.xy / u_resolution;
	vec3 c = vec3(0.0);
    float pct = 0.0;
    vec2 pos = vec2(0.5);
    float d = 0.0;
    
    c = flower(st, 2.0, 2.0, pos); 

    gl_FragColor = vec4(c, 1.0);
}