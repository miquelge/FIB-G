#version 330 core

uniform sampler2D colorMap;
uniform sampler2D colorMap1;
uniform sampler2D colorMap2;
uniform sampler2D colorMap3;

uniform float time;
uniform float slice = 1.0;

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;

void main()
{
	float x = mod(time, slice*4);
	vec4 a;
	if (x < slice) a = texture(colorMap, vtexCoord);
	if (x < slice*2) a = texture(colorMap1, vtexCoord);
	if (x < slice*3) a = texture(colorMap2, vtexCoord);
	else a = texture(colorMap3, vtexCoord);
    fragColor = a;
}
