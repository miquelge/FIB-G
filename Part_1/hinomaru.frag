#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

void main()
{


	if (distance(vec3(vtexCoord, 0), vec3(0.5, 0.5, 0)) < 0.2)
		fragColor = vec4(vec3(1, 0, 0), 1);
    else fragColor = vec4(vec3(1, 1, 1), 1);
}
