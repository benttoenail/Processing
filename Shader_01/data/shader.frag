#ifdef GL_ES
precision mediump float;
#endif

#define PROCESSING_COLOR-SHADER

//Unifroms - Bridges from the CPU to the GPU \\ 

uniform vec2 u_resolution;
uniform vec3 u_mouse;
uniform float u_time;

void gradient();
vec4 sinColor();
vec4 red();


void main()
{
	gl_FragColor = sinColor();
}


//HELLO WORLD!
void gradient()
{
	vec2 st  = gl_FragCoord.xy/u_resolution;	
	gl_FragColor = vec4(st.x, st.y,0.0,1.0);	
}


//Constructing a Vec4
vec4 red(float t)
{
	float r = abs(sin(t)* 0.2);
	float g = abs(sin(t)* 0.6);
	float b = abs(sin(t)* 0.9);

	return vec4(r, g, b, 1.0);
}


//Playing with Time
vec4 sinColor()
{
	float t = u_time;

	vec2 st  = gl_FragCoord.xy/u_resolution;
		
	float r = abs(5.0*(sin(st.x + t)*10.0));
	float g = abs(sin(st.y + t));

	return vec4(r,g,0.0,1.0);
}


