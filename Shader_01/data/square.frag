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

float square(vec2 st){
    float pct;
	//bottom left
    vec2 bl = step(vec2(0.1), st);
    pct = bl.x * bl.y;
    
    //top right
    vec2 tr = step(vec2(0.1), 1.0 -st);
    pct *= tr.x * tr.y;
    return pct;
}


void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;
	vec3 color = vec3(0.0);

	float x = square(st);    
    color = vec3(x, 0.0, 0.0);

    gl_FragColor = vec4(color,1.0);
}