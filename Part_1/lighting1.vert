#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord; // similar a gl_MultiTexCoord0

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

out vec4 frontColor;
out vec2 vtexCoord;

vec4 BlinnPhong(vec3 N, vec3 V, vec3 L) {
	vec4 res;
	//res = vec4(color, 1.0);
	res = matAmbient * lightAmbient; //ambient
	res += matDiffuse * lightDiffuse * max(0.0, dot(N, L)); //difusa
	vec3 H = normalize((V + L));
	res += matSpecular * lightSpecular * pow(max(0.0, dot(N, H)), matShininess); //especular
	return res;
}

void main() {
	vec3 P = (modelViewMatrix * vec4(vertex.xyz, 1.0)).xyz;
	vec3 N = normalize(normalMatrix * normal);
	//vec3 V = normalize(-P);
	vec3 V = vec3(0,0,1);
	vec3 L = normalize(lightPosition.xyz - P);
	frontColor = BlinnPhong(N, V, L);
	//frontColor = vec4(color,1.0) * N.z;
	vtexCoord = texCoord;
	gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
}
