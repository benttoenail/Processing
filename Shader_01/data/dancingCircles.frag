// Author:
// Title:

#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;


void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;
    float t = u_time;
    float s = sin(t*10.0)*0.1;//size
    float x = abs(cos(t*0.5));
    float y = abs(sin(t));

    s = abs(s);
    //a. DISTANCE from pixel to the center "0.5"
	float pct = 0.0;
    pct = step(distance(st, vec2(x, y)), s) + 
        step(distance(st, vec2(s+0.5,0.380)), 0.208);

    
    vec3 blue = vec3(0.0, 0.0, 1.0); // color circles blue
  	vec3 color = vec3(pct) * blue / vec3(1.0);
    

    gl_FragColor = vec4(color,1.0);
}