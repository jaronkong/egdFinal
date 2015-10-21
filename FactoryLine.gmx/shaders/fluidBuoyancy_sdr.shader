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
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D Velocity;
uniform sampler2D Temperature;
uniform sampler2D Density;
uniform float AmbientTemperature;
uniform float TimeStep;
uniform float Sigma;
uniform float Kappa;

void main()
{
    //ivec2 TC = ivec2(v_vTexcoord.xy);
    float T = texture2D(Temperature, v_vTexcoord).r - 0.5;
    vec2 V = texture2D( gm_BaseTexture, v_vTexcoord).xy - vec2( 0.5 );

    vec2 outColor = V;

    
    if (T > AmbientTemperature) {
        float D = texture2D(Density, v_vTexcoord).x - 0.5;
        outColor += (TimeStep * (T - AmbientTemperature) * Sigma - D * Kappa ) * vec2(0.0, 1.0);
    }
    
    gl_FragColor = vec4( outColor, 0.0, 1.0 ) + vec4( 0.5 );

}

