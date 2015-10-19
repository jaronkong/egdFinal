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

uniform sampler2D Velocity;
uniform sampler2D Obstacles;
uniform float HalfInverseCellSize;

uniform vec2 InvScreenSize;

void main()
{
    //ivec2 T = ivec2(v_vTexcoord.xy);
    
    // Find neighboring pressure:
    vec2 vN = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - InvScreenSize.y )).xy - vec2(0.5);
    vec2 vS = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + InvScreenSize.y )).xy - vec2(0.5);
    vec2 vE = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + InvScreenSize.x, v_vTexcoord.y )).xy - vec2(0.5);
    vec2 vW = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x - InvScreenSize.x, v_vTexcoord.y )).xy - vec2(0.5);

    // Find neighboring obstacles:
    vec3 oN = texture2D(Obstacles, vec2(v_vTexcoord.x, v_vTexcoord.y - InvScreenSize.y )).xyz - vec3(0.5);
    vec3 oS = texture2D(Obstacles, vec2(v_vTexcoord.x, v_vTexcoord.y + InvScreenSize.y )).xyz - vec3(0.5);
    vec3 oE = texture2D(Obstacles, vec2(v_vTexcoord.x + InvScreenSize.x, v_vTexcoord.y )).xyz - vec3(0.5);
    vec3 oW = texture2D(Obstacles, vec2(v_vTexcoord.x - InvScreenSize.x, v_vTexcoord.y )).xyz - vec3(0.5);
    /*
    // Find neighboring velocities:
    vec2 vN = texelFetchOffset(Velocity, T, 0, ivec2(0, 1)).xy;
    vec2 vS = texelFetchOffset(Velocity, T, 0, ivec2(0, -1)).xy;
    vec2 vE = texelFetchOffset(Velocity, T, 0, ivec2(1, 0)).xy;
    vec2 vW = texelFetchOffset(Velocity, T, 0, ivec2(-1, 0)).xy;

    // Find neighboring obstacles:
    vec3 oN = texelFetchOffset(Obstacles, T, 0, ivec2(0, 1)).xyz;
    vec3 oS = texelFetchOffset(Obstacles, T, 0, ivec2(0, -1)).xyz;
    vec3 oE = texelFetchOffset(Obstacles, T, 0, ivec2(1, 0)).xyz;
    vec3 oW = texelFetchOffset(Obstacles, T, 0, ivec2(-1, 0)).xyz;
    */

    // Use obstacle velocities for solid cells:
    if (oN.x > 0.0) vN = oN.yz;
    if (oS.x > 0.0) vS = oS.yz;
    if (oE.x > 0.0) vE = oE.yz;
    if (oW.x > 0.0) vW = oW.yz;

    float outColor = HalfInverseCellSize * (vE.x - vW.x + vS.y - vN.y);
    
    outColor += 0.5;
    
    gl_FragColor = vec4( outColor, outColor, outColor, 1.0 );

}
