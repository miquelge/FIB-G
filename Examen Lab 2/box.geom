#version 330 core
        
layout(triangles) in;
layout(line_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main( void )
{
	if  (gl_PrimitiveIDIn == 0) {
		gfrontColor = vec4 (0, 0, 0, 1);
		gl_Position = vec4(boundingBoxMin, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		gl_Position = vec4(boundingBoxMin.x, boundingBoxMin.y, boundingBoxMax.z, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		gl_Position = vec4(boundingBoxMax.x, boundingBoxMin.y, boundingBoxMax.z, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		gl_Position = vec4(boundingBoxMax.x, boundingBoxMin.y, boundingBoxMin.z, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		gl_Position = vec4(boundingBoxMin, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		EndPrimitive();


		gl_Position = vec4(boundingBoxMax, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		gl_Position = vec4(boundingBoxMin.x, boundingBoxMax.y, boundingBoxMax.z, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		gl_Position = vec4(boundingBoxMin.x, boundingBoxMax.y, boundingBoxMin.z, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		gl_Position = vec4(boundingBoxMax.x, boundingBoxMax.y, boundingBoxMin.z, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		gl_Position = vec4(boundingBoxMax, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		EndPrimitive();

		gl_Position = vec4(boundingBoxMin, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		gl_Position = vec4(boundingBoxMin.x, boundingBoxMax.y, boundingBoxMin.z, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();		
		EndPrimitive();
	
		gl_Position = vec4(boundingBoxMin.x, boundingBoxMin.y, boundingBoxMax.z, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		gl_Position = vec4(boundingBoxMin.x, boundingBoxMax.y, boundingBoxMax.z, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		EndPrimitive();

		gl_Position = vec4(boundingBoxMax.x, boundingBoxMin.y, boundingBoxMax.z, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		gl_Position = vec4(boundingBoxMax, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		EndPrimitive();

		gl_Position = vec4(boundingBoxMax.x, boundingBoxMin.y, boundingBoxMin.z, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		gl_Position = vec4(boundingBoxMax.x, boundingBoxMax.y, boundingBoxMin.z, 1);
		gl_Position = modelViewProjectionMatrix * gl_Position;
		EmitVertex();
		EndPrimitive();


		
	}
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();
}
