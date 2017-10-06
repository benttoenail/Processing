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

float shape(vec2 _st, float _size, int _num, vec2 pos){
    float d = 0.0;
    _st = _st+pos;//Shape Translation
    
    //Angle and Radius from current pixel
    float a = atan(_st.x, _st.y)+PI;
    float r = TWO_PI/float(_num);

    //Shaping Function that modulates the distance
    d = cos(floor(0.5+a/r)*r-a)*length(_st);
    
    return 1.0 - smoothstep(_size, _size+0.01, d);
}


void main() {
    vec2 st = gl_FragCoord.xy / u_resolution;
    st.x *= u_resolution.x / u_resolution.y;
    vec3 c = vec3(0.0);
    float t = sin(u_time*3.0)*0.1;
    
    //Move the space to center
    st = st * 2.0 - 1.0;

    
	float m = shape(st, 0.2, 4, vec2(0.670,0.010+t));
    float a = shape(st, 0.208, 3, vec2(0.0, 0.0+(sin(u_time*3.0+1.0)*0.1) ));
    float x = shape(st, 0.2, 6, vec2(-0.620,(sin(u_time*3.0+1.99)*0.1)));
    c = vec3((m+a+x));
    
    gl_FragColor = vec4(c, 1.0);
}






