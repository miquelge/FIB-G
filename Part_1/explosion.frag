#version 330 core

uniform sampler2D explosion;
uniform float time;

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

void main()
{
	float pos = time/(1./30.);
	pos = mod(pos, 48);
	int frame = int(pos);
	int col = frame%8;
	int fil = 5-frame/8;
	//part entera foat:
	// a int int(x), a float floor(x)
	vec4 a = texture(explosion, vec2(col/8., fil/6.) + vtexCoord*vec2(1/8., 1/6.));
    fragColor = a*a.a;
}
