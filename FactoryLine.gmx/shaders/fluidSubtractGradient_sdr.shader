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
uniform sampler2D Pressure;
uniform sampler2D Obstacles;
uniform float GradientScale;

uniform vec2 InvScreenSize;

void main()
{
    //ivec2 T = ivec2( v_vTexcoord.x * 1024.0, v_vTexcoord.y * 768.0 );

    vec3 oC = texture2D(Obstacles, v_vTexcoord).xyz;
    if (oC.x > 0.0) {
        gl_FragColor = vec4( oC.yz, 1.0, 1.0 );
        return;
    }

    // Find neighboring pressure:
    float pN = texture2D(Pressure, vec2(v_vTexcoord.x, v_vTexcoord.y - InvScreenSize.y )).r - 0.5;
    float pS = texture2D(Pressure, vec2(v_vTexcoord.x, v_vTexcoord.y + InvScreenSize.y )).r - 0.5;
    float pE = texture2D(Pressure, vec2(v_vTexcoord.x + InvScreenSize.x, v_vTexcoord.y )).r - 0.5;
    float pW = texture2D(Pressure, vec2(v_vTexcoord.x - InvScreenSize.x, v_vTexcoord.y )).r - 0.5;
    float pC = texture2D(Pressure, v_vTexcoord).r - 0.5;

    // Find neighboring obstacles:
    vec3 oN = texture2D(Obstacles, vec2(v_vTexcoord.x, v_vTexcoord.y - InvScreenSize.y )).xyz - vec3( 0.5 );
    vec3 oS = texture2D(Obstacles, vec2(v_vTexcoord.x, v_vTexcoord.y + InvScreenSize.y )).xyz - vec3( 0.5 );
    vec3 oE = texture2D(Obstacles, vec2(v_vTexcoord.x + InvScreenSize.x, v_vTexcoord.y )).xyz - vec3( 0.5 );
    vec3 oW = texture2D(Obstacles, vec2(v_vTexcoord.x - InvScreenSize.x, v_vTexcoord.y )).xyz - vec3( 0.5 );
    
    /*
    // Find neighboring pressure:
    float pN = texelFetchOffset(Pressure, T, 0, ivec2(0, 1)).r;
    float pS = texelFetchOffset(Pressure, T, 0, ivec2(0, -1)).r;
    float pE = texelFetchOffset(Pressure, T, 0, ivec2(1, 0)).r;
    float pW = texelFetchOffset(Pressure, T, 0, ivec2(-1, 0)).r;
    float pC = texelFetch(Pressure, T, 0).r;

    // Find neighboring obstacles:
    vec3 oN = texelFetchOffset(Obstacles, T, 0, ivec2(0, 1)).xyz;
    vec3 oS = texelFetchOffset(Obstacles, T, 0, ivec2(0, -1)).xyz;
    vec3 oE = texelFetchOffset(Obstacles, T, 0, ivec2(1, 0)).xyz;
    vec3 oW = texelFetchOffset(Obstacles, T, 0, ivec2(-1, 0)).xyz;
    */

    // Use center pressure for solid cells:
    vec2 obstV = vec2(0.0);
    vec2 vMask = vec2(1.0);

    if (oN.x > 0.0) { pN = pC; obstV.y = oN.z; vMask.y = 0.0; }
    if (oS.x > 0.0) { pS = pC; obstV.y = oS.z; vMask.y = 0.0; }
    if (oE.x > 0.0) { pE = pC; obstV.x = oE.y; vMask.x = 0.0; }
    if (oW.x > 0.0) { pW = pC; obstV.x = oW.y; vMask.x = 0.0; }

    // Enforce the free-slip boundary condition:
    vec2 oldV = texture2D( gm_BaseTexture, v_vTexcoord).xy - vec2( 0.5 );
    vec2 grad = vec2(pE - pW, pN - pS) * GradientScale;
    
    vec2 newV = vec2( oldV.x - grad.x, oldV.y - grad.y );
    
    vec2 outColor = vec2( (vMask.x * newV.x) + obstV.x, (vMask.y * newV.y ) + obstV.y );
    
    outColor += vec2( 0.5 );
    
    gl_FragColor = vec4(outColor, 0.5, 1.0 );  

    
}

