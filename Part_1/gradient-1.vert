#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vec3 red = vec3(1, 0, 0);
    vec3 yellow = vec3(1, 1, 0);
    vec3 green = vec3(0, 1, 0);
    vec3 cian = vec3(0, 1, 1);
    vec3 blue = vec3(0, 0, 1);
    vec3 colors[5] = vec3[](red, yellow, green, cian, blue);
    float aux = vertex.y-boundingBoxMin.y;
    float altura_capsa = boundingBoxMax.y - boundingBoxMin.y;
    float pos = (aux / altura_capsa)*4;
	if (pos>4) pos = 4.;
    vec3 col = mix(colors[int(pos)], colors[int(pos)+1], fract(pos));
    frontColor = vec4(col,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
