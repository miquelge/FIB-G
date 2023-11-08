#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 viewMatrixInverse;
uniform vec4 lightPosition;


uniform float amplitude=0.1;
uniform float freq = 1;
uniform float pi = 3.1415;
uniform float time;



void main()
{
	float factor = amplitude * sin(2*pi*freq*time + 2*pi*texCoord.s );
	vec3 nou_vertex = vertex + normalize(normal)*factor;
	vec3 N = normalize(normalMatrix * normal);
	gl_Position = modelViewProjectionMatrix * vec4(nou_vertex, 1.0);

    frontColor = vec4(N.z);
    vtexCoord = texCoord;
}
