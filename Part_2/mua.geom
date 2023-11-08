#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

uniform mat4 modelViewProjectionMatrix;
uniform float time;


const vec3 a = vec3(0, -9.8, 0);

in vec4 vfrontColor[];
in vec3 vnormal[];
out vec4 gfrontColor;

void main( void )
{
	vec3 v = 2*(vnormal[0]+vnormal[1]+vnormal[2]);
	for( int i = 0 ; i < 3 ; i++ )
	{
	//mua: x = x0 + v*t + a*t²/2
		gfrontColor = vfrontColor[i];
		vec3 P = gl_in[i].gl_Position.xyz;
		float t = 2*time;
		P += t*v + 0.5*t*t*a;
		gl_Position = modelViewProjectionMatrix * vec4(P, 1);
		EmitVertex();
	}
    EndPrimitive();
}
