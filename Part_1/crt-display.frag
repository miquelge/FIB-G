#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform int n = 2;

void main()
{
	int aux = int(gl_FragCoord.y);
	int y = aux % n;
	if (y != 0) {
		discard;
	}
	fragColor = frontColor;
}
