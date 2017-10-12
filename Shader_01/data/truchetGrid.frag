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

vec2 rotate2d (vec2 _st, float _angle) {
    _st -= 0.5;
    _st =  mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle)) * _st;
    _st += 0.5;
    return _st;
}

vec2 tile(vec2 st, float r){
    st *= r;
    return fract(st);
}

vec2 rotateTilePattern(vec2 st){
    //Scale the coord system by 2x2
    st *= 2.0;
    //Give each cell an index number
    //according to its position
    float index = 0.0;
    index += step(1.0, mod(st.x, 2.0));
    index += step(1.0, mod(st.y, 2.0))*2.0;
    
        //      |
    //  2   |   3
    //      |
    //--------------
    //      |
    //  0   |   1
    //      |
    
    //Make each cell between 0.0 and 1.0
    st = fract(st);
    
    //Rotate each cell according to index
    if(index == 1.0){
        st = rotate2d(st, PI*0.5);
        //rotate 1 cell by 90 degrees
    }else if(index == 2.0){
        //rotate -90 degrees
        st = rotate2d(st, PI*-0.5);
    }else if(index == 3.0){
        //rotate 180 degrees
        st = rotate2d(st, PI);
    }
    
    return st;
}


void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;
    float t = u_time;
    //Apply scaling functions
    st = tile(st, 3.0);
    st = rotateTilePattern(st);
    
    //Apply transforms to st
    st = tile(st, 3.0);
    st = rotate2d(st, t*0.5);
    st = (rotateTilePattern(st*1.0));
    st = rotate2d(st, PI*t*0.1);
    
    // Creates simple triangle
    float tri = step(st.x, st.y); 

    gl_FragColor = vec4(tri);
}
