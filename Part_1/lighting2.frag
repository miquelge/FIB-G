#version 330 core

in vec4 frontColor;
out vec4 fragColor;
//N, P

void main()
{
	//La normal la passem a eye space al VS (si volem calcular iluminacio al FS)
	// haurem de normalitzar la normal abans de calcular res (al FS)
	//L, v, .. claculem aquests vector al FS
	fragColor = frontColor;
}