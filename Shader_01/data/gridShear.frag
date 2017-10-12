// Author:
// Title:

#ifdef GL_ES
precision mediump float;
#endif

#define TWO_PI 6.28318530718
#define PI 3.14159265359


uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;


vec2 tile(in vec2 _st, float x){
    _st *= x;
    return fract(_st);
}

vec2 brickTile(vec2 _st, float _zoom){
    _st *= _zoom;
    
    float lm = _st.x += mod(_st.y, 2.0) < 1.0 ? 0.0 : 1.0 + u_time;
    float rm = _st.x += step(0.0, mod(_st.y, 1.0)) - u_time;
    
    _st = vec2(lm+rm);
    return fract(_st);
}
//--END--


//Shape Functions
vec3 flower(vec2 _st, float _r, float _numSides, vec2 _pos){
    vec2 pos = vec2(_pos)-_st;
    float r = length(pos)*_r;
    
    float a = atan(pos.y, pos.x);
    float f = fract(cos(a * _numSides));
    
    return vec3(1.0 - smoothstep(f, f+0.04, r));
}
//--END--


void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;
    float t = u_time;
	vec3 color = vec3(0.0);
    vec3 f = vec3(0.0);
   
    
    st = brickTile(st, 6.0);
	f = flower(st, 2.084, 3.0, vec2(0.5));
    
    color = vec3(f);

    gl_FragColor = vec4(color,1.0);
}
