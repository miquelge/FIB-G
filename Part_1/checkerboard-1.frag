#version 330 core

uniform sampler2D colorMap;

out vec4 fragColor;
in vec2 vtexCoord;

void main()
{
	float s = floor(vtexCoord.s * 8);
	float t = floor(vtexCoord.t * 8);
	
	if (mod(s, 2) == mod(t, 2)) fragColor = vec4(0.8, 0.8, 0.8, 0);
		else fragColor = vec4(0, 0, 0, 0);
	
}
	
