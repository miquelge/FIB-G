#version 330 core

uniform vec4 matDiffuse;
uniform vec4 lightDiffuse;
uniform vec4 lightPosition;

in vec4 frontColor;
in vec3 vvertex;
out vec4 fragColor;

void main()
{
	vec3 N = normalize(cross(dFdx(vvertex), dFdy(vvertex)));
    fragColor = frontColor * N.z;
}
