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

}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// 
//

varying vec2 coord;
varying vec4 baseColor;

uniform vec2 invScreenSize;


void main()
{

    //Find neighboring values
    vec4 current = texture2D( gm_BaseTexture, coord );
    vec4 N = texture2D( gm_BaseTexture, vec2(coord.x, coord.y + invScreenSize.y ));
    vec4 S = texture2D( gm_BaseTexture, vec2(coord.x, coord.y - invScreenSize.y ));
    vec4 E = texture2D( gm_BaseTexture, vec2(coord.x + invScreenSize.x, coord.y ));
    vec4 W = texture2D( gm_BaseTexture, vec2(coord.x - invScreenSize.x, coord.y ));
    

    
    gl_FragColor = max(max( N, S ), max( E, W ));
    //gl_FragColor = prevState;
                    
}

