#version 330 core


out vec4 fragColor;
in vec2 vtexCoord;

uniform sampler2D skeleton;


void main()
{	
	vec4 aux = texture(skeleton, vtexCoord);
	aux = vec4(1-aux.x, 1-aux.y, 1-aux.z, aux);
    fragColor = aux;
}
