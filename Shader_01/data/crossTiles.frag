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

vec2 rotate2d(in vec2 _st, float _angle){
    _st -= vec2(0.5);
    _st = mat2(cos(_angle), -sin(_angle),
              sin(_angle), cos(_angle)) * _st;
    _st += vec2(0.5);
    return _st;
}

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
float cross(in vec2 _st, float _size){
    return  box(_st, vec2(_size,_size/4.)) +
            box(_st, vec2(_size/4.,_size));
}

vec2 tile(in vec2 _st, float x){
    _st *= x;
    return fract(_st);
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;
    float t = u_time;
	vec3 color = vec3(0.0);
    vec2 mult = vec2(3.0);
    
	st = tile(st, 6.0);
    st = rotate2d(st, t);
    
    color = vec3(st, 0.0);
    color = vec3(cross(st, 0.5));
    

    gl_FragColor = vec4(color,1.0);
}
