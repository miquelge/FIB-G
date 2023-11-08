#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform int tiles = 1;
uniform float time;

void main()
{
	float pos = time/(1./30.);
	pos = mod(pos, 44);
	int frame = int(pos);
    vtexCoord = vec2(frame/44. + tiles*texCoord.x/44., tiles*texCoord.y);
    gl_Position = vec4(vertex, 1.0);
}
