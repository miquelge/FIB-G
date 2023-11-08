#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;

void main()
{
	float angle;
	if (vertex.y<0.5) angle = 0;
	else angle = (vertex.y-0.5)*sin(time);
	vec3 trans = vec3(0, -1, 0);
	mat3 rot = mat3(vec3(1,0,0),
		vec3(0,cos(angle),sin(angle)),
		vec3(0,-sin(angle),cos(angle)));
	vec3 nou_vertex = rot * (vertex+trans);
	nou_vertex = nou_vertex - trans;
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    gl_Position = modelViewProjectionMatrix * vec4(nou_vertex, 1.0);
}
