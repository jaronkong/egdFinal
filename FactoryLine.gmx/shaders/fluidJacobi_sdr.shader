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

uniform sampler2D Pressure;
uniform sampler2D Divergence;
uniform sampler2D Obstacles;

uniform float Alpha;
uniform float InverseBeta;

uniform vec2 InvScreenSize;

void main()
{
    //ivec2 T = ivec2( v_vTexcoord.x * 1024.0, v_vTexcoord.y * 768.0 );
    // Find neighboring pressure:
    vec4 pN = texture2D( gm_BaseTexture, 
                vec2(v_vTexcoord.x, v_vTexcoord.y - InvScreenSize.y )) - vec4( 0.5 );
    vec4 pS = texture2D( gm_BaseTexture, 
                vec2(v_vTexcoord.x, v_vTexcoord.y + InvScreenSize.y )) - vec4( 0.5 );
    vec4 pE = texture2D( gm_BaseTexture, 
                vec2(v_vTexcoord.x + InvScreenSize.x, v_vTexcoord.y )) - vec4( 0.5 );
    vec4 pW = texture2D( gm_BaseTexture, 
                vec2(v_vTexcoord.x - InvScreenSize.x, v_vTexcoord.y )) - vec4( 0.5 );
    vec4 pC = texture2D( gm_BaseTexture, v_vTexcoord) - vec4( 0.5 );

    // Find neighboring obstacles:
    vec3 oN = texture2D(Obstacles, vec2(v_vTexcoord.x, v_vTexcoord.y - InvScreenSize.y )).xyz - vec3( 0.5 );
    vec3 oS = texture2D(Obstacles, vec2(v_vTexcoord.x, v_vTexcoord.y + InvScreenSize.y )).xyz - vec3( 0.5 );
    vec3 oE = texture2D(Obstacles, vec2(v_vTexcoord.x + InvScreenSize.x, v_vTexcoord.y )).xyz - vec3( 0.5 );
    vec3 oW = texture2D(Obstacles, vec2(v_vTexcoord.x - InvScreenSize.x, v_vTexcoord.y )).xyz - vec3( 0.5 );
    
    /*
    // Find neighboring pressure:
    vec4 pN = texelFetchOffset(Pressure, T, 0, ivec2(0, 1));
    vec4 pS = texelFetchOffset(Pressure, T, 0, ivec2(0, -1));
    vec4 pE = texelFetchOffset(Pressure, T, 0, ivec2(1, 0));
    vec4 pW = texelFetchOffset(Pressure, T, 0, ivec2(-1, 0));
    vec4 pC = texelFetch(Pressure, T, 0);

    // Find neighboring obstacles:
    vec3 oN = texelFetchOffset(Obstacles, T, 0, ivec2(0, 1)).xyz;
    vec3 oS = texelFetchOffset(Obstacles, T, 0, ivec2(0, -1)).xyz;
    vec3 oE = texelFetchOffset(Obstacles, T, 0, ivec2(1, 0)).xyz;
    vec3 oW = texelFetchOffset(Obstacles, T, 0, ivec2(-1, 0)).xyz;
    */

    // Use center pressure for solid cells:
    if (oN.x > 0.0) {pN = pC;}
    if (oS.x > 0.0) {pS = pC;}
    if (oE.x > 0.0) {pE = pC;}
    if (oW.x > 0.0) {pW = pC;}

    vec4 bC = texture2D( Divergence, v_vTexcoord ) - vec4( 0.5 );
    //gl_FragColor = (pW + pE + pS + pN + vec4(Alpha) * bC) * InverseBeta;
    vec4 outColor = (pW + pE + pS + pN + vec4(Alpha) * bC.r) * InverseBeta;
    
    outColor += vec4( 0.5 );
    gl_FragColor = vec4( outColor.r, outColor.r, outColor.r, 1.0 );
    
    /*
    if ( bC.r > 0.0 ) {
        gl_FragColor = pC + vec4( outColor.r + 0.51, outColor.r + 0.51, outColor.r + 0.51, 1.0 );
    }
    */
    
    
    

}

