#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 viewMatrixInverse;
uniform vec4 lightPosition;

uniform float n=4;

void main()
{
	float d = distance(vec4(vertex, 1.0), viewMatrixInverse*lightPosition);
	float w = clamp(1/(pow(d,n)), 0, 1);
	vec4 nou_vertex = (1-w)*vec4(vertex, 1.0) + w*viewMatrixInverse*lightPosition;
	gl_Position = modelViewProjectionMatrix * nou_vertex;
	vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(N.z);
}
