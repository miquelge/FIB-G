#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

void main( void )
{
	if (gl_PrimitiveIDIn == 0) {
		gfrontColor = vec4(0, 1, 0, 0);
		gl_Position =  vec4(-1, 1, 0.999, 1);
		EmitVertex();
		gl_Position =  vec4(0, 1, 0.999, 1);
		EmitVertex();
		gl_Position =  vec4(-1, 0, 0.999, 1);
		EmitVertex();
		gl_Position =  vec4(0, 0, 0.999, 1);
		EmitVertex();
		EndPrimitive();

		gfrontColor = vec4(1, 1, 0, 0);
		gl_Position =  vec4(0, 1, 0.999, 1);
		EmitVertex();
		gl_Position =  vec4(1, 1, 0.999, 1);
		EmitVertex();
		gl_Position =  vec4(0, 0, 0.999, 1);
		EmitVertex();
		gl_Position =  vec4(1, 0, 0.999, 1);
		EmitVertex();
		EndPrimitive();

		gfrontColor = vec4(1, 0, 0, 0);
		gl_Position =  vec4(-1, 0, 0.999, 1);
		EmitVertex();
		gl_Position =  vec4(0, 0, 0.999, 1);
		EmitVertex();
		gl_Position =  vec4(-1, -1, 0.999, 1);
		EmitVertex();
		gl_Position =  vec4(0, -1, 0.999, 1);
		EmitVertex();
		EndPrimitive();

		gfrontColor = vec4(0, 0, 1, 0);
		gl_Position =  vec4(0, 0, 0.999, 1);
		EmitVertex();
		gl_Position =  vec4(1, 0, 0.999, 1);
		EmitVertex();
		gl_Position =  vec4(0, -1, 0.999, 1);
		EmitVertex();
		gl_Position =  vec4(1, -1, 0.999, 1);
		EmitVertex();
		EndPrimitive();
	}
	
	
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		gl_Position = gl_Position/gl_Position.a;
		gl_Position.x -= 0.5;
		gl_Position.y += 0.5;
		gl_Position = gl_Position * gl_Position.a;
		EmitVertex();
	}
    	EndPrimitive();
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		gl_Position = gl_Position/gl_Position.a;
		gl_Position.x += 0.5;
		gl_Position.y += 0.5;
		gl_Position = gl_Position * gl_Position.a;
		EmitVertex();
	}
    	EndPrimitive();
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		gl_Position = gl_Position/gl_Position.a;
		gl_Position.x -= 0.5;
		gl_Position.y -= 0.5;
		gl_Position = gl_Position * gl_Position.a;
		EmitVertex();
	}
    	EndPrimitive();
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		gl_Position = gl_Position/gl_Position.a;
		gl_Position.x += 0.5;
		gl_Position.y -= 0.5;
		gl_Position = gl_Position * gl_Position.a;
		EmitVertex();
	}
    	EndPrimitive();

}
