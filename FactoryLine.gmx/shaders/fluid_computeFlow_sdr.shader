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
// Fludstate map to flow map
//

varying vec2 coord;
varying vec4 baseColor;
//varying vec2 normal_texcoord;

uniform sampler2D stateMap;
uniform vec2 invScreenSize;

//Draw the fluid state as a flow map

void main()
{

    

    //Find neighboring values
    vec4 current = texture2D( gm_BaseTexture, coord );
    vec4 N = texture2D( gm_BaseTexture, vec2(coord.x, coord.y + invScreenSize.y ));
    vec4 S = texture2D( gm_BaseTexture, vec2(coord.x, coord.y - invScreenSize.y ));
    vec4 E = texture2D( gm_BaseTexture, vec2(coord.x + invScreenSize.x, coord.y ));
    vec4 W = texture2D( gm_BaseTexture, vec2(coord.x - invScreenSize.x, coord.y ));
    
    
    float totalAlphaDiff = 0.0;
    float numOutFlow = 0.0;
    float maxAlpha = 1.0; //Fade out rate bigger=thicker fluid
    if ( N.a < current.a ) {
        numOutFlow += 1.0;
        totalAlphaDiff += current.a - N.a;
        maxAlpha = max( N.a, maxAlpha );
    }
    if ( S.a < current.a ) {
        numOutFlow += 1.0;
        totalAlphaDiff += current.a - S.a;
        maxAlpha = max( S.a, maxAlpha );
    }
    if ( E.a < current.a ) {
        numOutFlow += 1.0;
        totalAlphaDiff += current.a - E.a;
        maxAlpha = max( E.a, maxAlpha );
    }
    if ( W.a < current.a ) {
        numOutFlow += 1.0;
        totalAlphaDiff += current.a - W.a;
        maxAlpha = max( W.a, maxAlpha );
    }
    
   
    
    float fraction = totalAlphaDiff / numOutFlow * 5.0; //126.0

    
    gl_FragColor = vec4( 
                        clamp( fraction, 0.0, maxAlpha ),
                        clamp( fraction, 0.0, maxAlpha ),
                        clamp( fraction, 0.0, maxAlpha ),
                        clamp( fraction, 0.0, maxAlpha ) );
                        
                /*        
    gl_FragColor = vec4( 
                        clamp( (current.a - E.a)*fraction, 0.0, maxAlpha ),
                        clamp( (current.a - N.a)*fraction, 0.0, maxAlpha ),
                        clamp( (current.a - W.a)*fraction, 0.0, maxAlpha ),
                        clamp( (current.a - S.a)*fraction, 0.0, maxAlpha ) );
                        */
                        
                        
                    
}

