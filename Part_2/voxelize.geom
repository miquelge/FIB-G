#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

out vec3 gnormal;

uniform float step = 0.2;
uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main( void )
{
	vec4 b = (gl_in[0].gl_Position + gl_in[1].gl_Position + gl_in[2].gl_Position)/3;
	float s = step/2;
	float i = round (b.x/step);
	b.x = i*step;
	float j = round (b.y/step);
	b.y = j*step;
	float k = round (b.z/step);
	b.z = k*step;

	gnormal = normalMatrix * vec3(0, 1, 0);
	gl_Position = modelViewProjectionMatrix * (b + vec4(-s, +s, -s, 0));
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * (b + vec4(+s, +s, -s, 0));
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * (b + vec4(-s, +s, +s, 0));
	EmitVertex();
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
