#version 330 core

in vec4 gfrontColor;
in vec2 gtexCoord;
in vec4 gnormal;
out vec4 fragColor;

uniform sampler2D colorMap;

void main()
{
	vec4 a = texture(colorMap, gtexCoord);
    fragColor = gfrontColor * a * gnormal.z;
}
