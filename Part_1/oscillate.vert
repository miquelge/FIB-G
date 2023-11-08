#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;
uniform bool eyespace = true;
uniform float time;

void main()
{
	float r = distance(boundingBoxMin, boundingBoxMax)/2.0;
	float y_aux;
	if (eyespace) y_aux = (modelViewMatrix*vec4(vertex, 1.0)).y;
	else y_aux = vertex.y;
	float a = (r/10)*y_aux;
	float d = a * sin(time); 
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    vec3 nou_vertex = vertex + normalize(normal)*d;
    gl_Position = modelViewProjectionMatrix * vec4(nou_vertex, 1.0);
}
