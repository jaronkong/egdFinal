//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// 
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//uniform sampler2D VelocityTexture;
uniform sampler2D SourceTexture;
uniform sampler2D Obstacles;

uniform vec2 InverseSize;
uniform float TimeStep;
uniform float Dissipation;

void main()
{
    //gl_FragColor = texture2D(SourceTexture, v_vTexcoord);
    
    vec2 fragCoord = vec2( v_vTexcoord.x * 1024.0, v_vTexcoord.y * 768.0 );
    float solid = texture2D(Obstacles, v_vTexcoord).x;
    if (solid > 0.0) {
        gl_FragColor = vec4(0.0);
        return;
    }

    vec2 u = texture2D(gm_BaseTexture, v_vTexcoord).xy;
    vec2 coord = InverseSize * (fragCoord - TimeStep * u);

    gl_FragColor = Dissipation * texture2D(gm_BaseTexture, coord);
    /*
    vec2 fragCoord = vec2( v_vTexcoord.x * 1024.0, v_vTexcoord.y * 768.0 );
    float solid = texture2D(Obstacles, v_vTexcoord).x;
    if (solid > 0.0) {
        gl_FragColor = vec4(0.0);
        return;
    }

    vec2 u = texture2D(gm_BaseTexture, v_vTexcoord).xy;
    vec2 coord = InverseSize * (fragCoord - TimeStep * u);

    gl_FragColor = Dissipation * texture2D(SourceTexture, coord);
    */
    

}


