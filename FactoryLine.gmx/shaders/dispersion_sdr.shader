attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 coord;
varying vec4 baseColor;
varying vec2 normal_texcoord;



void main()
{
    coord = in_TextureCoord;
    baseColor = in_Colour;

    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
    
    
    //vec2 normal_texcoord = mix( uvs_normal.xy, uvs_normal.zw, coord );
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 coord;
varying vec4 baseColor;
//varying vec2 normal_texcoord;

uniform vec4 uvs_normal;
uniform sampler2D normalMap;
uniform float decay;

void main()
{
    vec2 normal_texcoord = mix( uvs_normal.xy, uvs_normal.zw, coord );

    vec3 normal = texture2D(normalMap, normal_texcoord).rgb * 2.0 - 1.0;
    //vec4 baseColor = texture2D(gm_BaseTexture, coord + normal.rg * 0.5 );
    vec4 baseColor = texture2D(gm_BaseTexture, coord - normal.rg * 0.05 );
    vec3 newBaseColor = baseColor.rgb * decay;
    float newAlpha = baseColor.a * decay;
    
 
    gl_FragColor = vec4( newBaseColor, newAlpha );
}

