 #version 330 core

uniform sampler2D colorMap;
uniform int tiles=1;


in vec2 vtexCoord;
out vec4 fragColor;

void main()
{
    vec4 a = texture(colorMap, vtexCoord*tiles);
    fragColor = a;
}
