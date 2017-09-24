#ifdef GL_ES
precision mediump float;
#endif

#define PROCESSING_COLOR-SHADER

uniform vec2 u_resolution;
uniform vec3 u_mouse;
uniform float u_time;

void gradient();

void main()
{
	//gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
	gradient();
}

void gradient()
{
	vec2 st  = gl_FragCoord.st/u_resolution;
	gl_FragColor = vec4(st.x,st.y,0.0,1.0);	
}