#version 330 core

uniform float n=4;
in vec4 frontColor;
out vec4 fragColor;

void main()
{
    fragColor = frontColor;
}
