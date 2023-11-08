#version 330 core


uniform sampler2D colorMap;
uniform float time;
uniform float speed = 0.1;

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;


void main()
{
    vec4 a = texture(colorMap, vtexCoord+vec2(+time*speed));
    fragColor = frontColor * a;
}
