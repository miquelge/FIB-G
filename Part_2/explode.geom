#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

uniform mat4 modelViewProjectionMatrix;
uniform float time;

const float speed = 0.5;

in vec4 vfrontColor[];
in vec3 vnormal[];
out vec4 gfrontColor;

void main( void )
{
	vec3 N = (vnormal[0]+vnormal[1]+vnormal[2])/3;
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		vec3 P = gl_in[i].gl_Position.xyz;
		P += speed * time * N;
		gl_Position = modelViewProjectionMatrix * vec4(P, 1.0);
		EmitVertex();
	}
    EndPrimitive();
}
