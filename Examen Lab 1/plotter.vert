#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;


uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float xmin = -6;
uniform float xmax = 6;
uniform float ymin = -2;
uniform float ymax = 2;

void main()
{

	float x = (vertex.x-(-1)) * (xmax-xmin)/2 + xmin;
	float y;
	if (vertex.z == -2) {
		y = sin(x);
		frontColor = vec4(1, 0, 0, 1.);
	}
	if (vertex.z == 0) {
		float aux = -pow(x,2)/6;
		y = 2*exp(aux);
		frontColor = vec4(0, 1, 0, 1.);
	}
	if (vertex.z == 2) {
		y = sin(2*x);
		frontColor = vec4(0, 0, 1, 1.);
	}
	y = (y-ymin)*2/(ymax-ymin) + (-1);
    gl_Position = vec4(vertex.x, y+vertex.y, 0, 1);
}
