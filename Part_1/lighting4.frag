#version 330 core

uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelMatrixInverse;
uniform mat4 viewMatrixInverse;
uniform mat4 projectionMatrixInverse;
uniform mat4 modelViewMatrixInverse;
uniform mat4 modelViewProjectionMatrixInverse;
uniform mat3 normalMatrix;

uniform vec4 lightAmbient;
uniform vec4 lightDiffuse;
uniform vec4 lightSpecular;
uniform vec4 lightPosition;

uniform vec4 matAmbient;
uniform vec4 matDiffuse;
uniform vec4 matSpecular;
uniform float matShininess;

in vec3 vnormal;
in vec3 vvertex;
out vec4 fragColor;

vec4 Phong(vec3 N, vec3 V, vec3 L) {
	vec4 res;
	res = matAmbient * lightAmbient; //ambient
	res += matDiffuse * lightDiffuse * max(0.0, dot(N, L)); //difusa
	vec3 R = normalize(2*dot(N,L)*N-L);
	res += matSpecular * lightSpecular * pow(max(0.0, dot(V, R)), matShininess); //especular
	return res;
}


void main()
{
	//La normal la passem a eye space al VS (si volem calcular iluminacio al FS)
	// haurem de normalitzar la normal abans de calcular res (al FS)
	//L, v, .. claculem aquests vector al FS
	vec3 N = normalize(vnormal);
	vec3 P = (modelViewMatrix * vec4(vvertex.xyz, 1.0)).xyz;
	vec3 V = normalize(-P);
	vec3 L = normalize(lightPosition.xyz - P);
	fragColor = Phong(N, V, L);
}
