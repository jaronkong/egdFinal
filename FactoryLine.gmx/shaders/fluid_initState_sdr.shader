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
// Create a fluid instance, initializes properties like pressure and velocity
//

varying vec2 coord;
varying vec4 baseColor;
//varying vec2 normal_texcoord;


void main()
{
    float decay = 0.4; //Global decay rate. bigger=more fade
    
    vec4 posColor = texture2D( gm_BaseTexture, coord );
    vec3 outColor = vec3( 0.0 );
    
    if ( baseColor.a > 0.0 ) {
        outColor = vec3( 1.0, 0, 0 );
    }
    float newAlpha = posColor.a - posColor.a*decay;
    if ( newAlpha <= 0.2 ) {
        newAlpha = 0.0;
    }
 
    gl_FragColor = vec4( outColor, newAlpha );
}

