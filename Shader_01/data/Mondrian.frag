// Author:
// Title:

#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float plot(vec2 st, float pct){
    return smoothstep(pct-0.02, pct, st.y) -
        smoothstep(pct, pct+0.02, st.y);
}

float Mondrain(vec2 st){
    float pct;
	//bottom left
    vec2 s1 = step(vec2(-0.030,0.800), vec2(st));
    vec2 s2 = step(vec2(-0.070,0.230),1.0 - st);
    vec2 s3 = step(vec2(0.420,0.200), st);
    
    vec2 s4 = step(vec2(0.920,-0.020), 1.0-st);
    vec2 s5 = step(vec2(0.110,-0.110), st);
    
    vec2 s6 = step(vec2(-0.120,1.000), st);
    vec2 s7 = step(vec2(-0.050,0.690),1.0- st);
    vec2 s8 = step(vec2(0.450,0.000), st);
    
    float x1 = s1.x*s1.y;
    float x2 = s2.x*s2.y;
    float x3 = s3.x*s2.y;
    
    float x4 = s4.x*s4.y;
    float x5 = s5.x*s5.y;
    
    float x6 = s6.x*s6.y;
    float x7  =s7.x*s7.y;
    
    float px45 = x4 + x5;
    float px67 = x6 + x7 * (s8.x*s8.y);
    
    pct = x1+x2-x3/px45+px67;

    return pct;
}


void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;
	vec3 color = vec3(0.0);

	float x = Mondrain(st);    
    color = vec3(x, 0.0, 0.0);

    gl_FragColor = vec4(color,1.0);
}