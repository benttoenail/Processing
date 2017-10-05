// Author:
// Title:

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 flower(vec2 _st, float _r, float _numsides, vec2 _pos){
    //float t = clamp(abs(sin(u_time*0.5)), 0.0, 1.0)*5.0;
    float t = cos(u_time*0.25)*2.0+1.0;
    vec2 pos = vec2(_pos)-_st;
    float r = length(pos)*_r*(t);
    
    float a = atan(pos.y, pos.x);
    float f = cos(a * _numsides);
    f = (abs(cos(a*_numsides)*sin(a*_numsides/2.0))*0.240);
    
    float red = 1.0 - smoothstep(f, f+0.020, r) - 
               smoothstep(f, f-0.02, r);
    
    float green = 1.0 -smoothstep(f, r+0.012, r) - 
        smoothstep(f, r-0.02*t, r);
    
    float blue = r * 6.0;
    
    vec3 color = vec3(mix(red+t, green, blue));
    
    return vec3(color);
}


void main() {
    vec2 st = gl_FragCoord.xy / u_resolution;
    vec3 c = vec3(0.0);
    float t = sin(u_time*0.25);
    
    vec3 f1 = vec3(flower(st, 0.5, 5.0, vec2(0.5)));
    vec3 f2 = vec3(flower(st, 0.58+t, 5.0, vec2(0.5)));
    vec3 f3 = vec3(flower(st, 0.786+t, 5.0, vec2(0.5)));
    
    c = f1 * f2 / f3;
    
    gl_FragColor = vec4(c, 1.0);
}






