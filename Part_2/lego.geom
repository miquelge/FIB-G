#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec3 gnormal;
out vec2 gtexCoord;
out vec4 gfrontColor;

uniform float step = 0.2;
uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main( void )
{
	vec3 red = vec3(1, 0, 0);
	vec3 green = vec3(0, 1, 0);
	vec3 blue = vec3(0, 0, 1);
	vec3 yellow = vec3(1, 1, 0);
	vec3 cyan = vec3(0, 1, 1);
	//green
	vec3 real = ((vfrontColor[0] + vfrontColor[1] + vfrontColor[1])/3).xyz;
	vec3 sol = green;
	float dist = distance(real, green);
	//red
	if (distance(real, red) <= dist) {
		dist = distance(real, red);
		sol = red;
	}
	//blue
	if (distance(real, blue) <= dist) {
		dist = distance(real, blue);
		sol = blue;
	}
	//yellow
	if (distance(real, yellow) <= dist) {
		dist = distance(real, yellow);
		sol = yellow;
	}
	//cyan
	if (distance(real, cyan) <= dist) {
		dist = distance(real, cyan);
		sol = cyan;
	}
	
	gfrontColor = vec4(sol, 0);
	
	vec4 b = (gl_in[0].gl_Position + gl_in[1].gl_Position + gl_in[2].gl_Position)/3;
	float s = step/2;
	float i = round (b.x/step);
	b.x = i*step;
	float j = round (b.y/step);
	b.y = j*step;
	float k = round (b.z/step);
	b.z = k*step;

	gnormal = normalMatrix * vec3(0, 1, 0);
	gtexCoord = vec2(1,1);
	gl_Position = modelViewProjectionMatrix * (b + vec4(-s, +s, -s, 0));
	EmitVertex();
	gtexCoord = vec2(0,1);
	gl_Position = modelViewProjectionMatrix * (b + vec4(+s, +s, -s, 0));
	EmitVertex();
	gtexCoord = vec2(1,0);
	gl_Position = modelViewProjectionMatrix * (b + vec4(-s, +s, +s, 0));
	EmitVertex();
	gtexCoord = vec2(0,0);
    gl_Position = modelViewProjectionMatrix * (b + vec4(+s, +s, +s, 0));
	EmitVertex();
    EndPrimitive();
    
	gnormal = normalMatrix * vec3(0, -1, 0);
	gl_Position = modelViewProjectionMatrix * (b + vec4(+s, -s, +s, 0));
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * (b + vec4(-s, -s, +s, 0));
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * (b + vec4(+s, -s, -s, 0));
	EmitVertex();
    gl_Position = modelViewProjectionMatrix * (b + vec4(-s, -s, -s, 0));
	EmitVertex();
    EndPrimitive();
    
    gnormal = normalMatrix * vec3(1, 0, 0);
	gl_Position = modelViewProjectionMatrix * (b + vec4(+s, -s, +s, 0));
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * (b + vec4(+s, +s, +s, 0));
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * (b + vec4(+s, -s, -s, 0));
	EmitVertex();
    gl_Position = modelViewProjectionMatrix * (b + vec4(+s, +s, -s, 0));
	EmitVertex();
    EndPrimitive();
    
    gnormal = normalMatrix * vec3(-1, 0, 0);
	gl_Position = modelViewProjectionMatrix * (b + vec4(-s, +s, -s, 0));
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * (b + vec4(-s, -s, -s, 0));
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * (b + vec4(-s, +s, +s, 0));
	EmitVertex();
    gl_Position = modelViewProjectionMatrix * (b + vec4(-s, -s, +s, 0));
	EmitVertex();
    EndPrimitive();
    
    gnormal = normalMatrix * vec3(0, 0, 1);
	gl_Position = modelViewProjectionMatrix * (b + vec4(-s, +s, +s, 0));
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * (b + vec4(+s, +s, +s, 0));
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * (b + vec4(-s, -s, +s, 0));
	EmitVertex();
    gl_Position = modelViewProjectionMatrix * (b + vec4(+s, -s, +s, 0));
	EmitVertex();
    EndPrimitive();
    
    gnormal = normalMatrix * vec3(0, 0, -1);
	gl_Position = modelViewProjectionMatrix * (b + vec4(+s, -s, -s, 0));
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * (b + vec4(-s, -s, -s, 0));
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * (b + vec4(+s, +s, -s, 0));
	EmitVertex();
    gl_Position = modelViewProjectionMatrix * (b + vec4(-s, +s, -s, 0));
	EmitVertex();
    EndPrimitive();
}
