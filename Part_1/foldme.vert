#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time;

void main()
{
	float angle = -time*texCoord.s; 
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(vec3(0, 0, 1),1.0);
    vtexCoord = texCoord;
    mat3 matriu_rot = mat3(vec3(cos(angle), 0, -sin(angle)), vec3(0, 1, 0), vec3(sin(angle), 0, cos(angle)));
    vec3 aux = matriu_rot * vertex;
    gl_Position = modelViewProjectionMatrix * vec4(aux, 1.0);
}





