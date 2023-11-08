#version 330 core


uniform sampler2D colorMap;
//uniform sampler2D colorMap1;
//uniform float w;
//uniform float time;

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;


void main()
{
    vec4 a = texture(colorMap, vtexCoord);
    fragColor = frontColor * a;


    //fragColor = mix (a, b, w);
    //interpola: resultat = a*w + b*(1-w);

}
