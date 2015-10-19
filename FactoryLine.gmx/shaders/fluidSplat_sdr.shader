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

uniform vec2 Point;
uniform float Radius;
uniform vec3 FillColor;
uniform vec2 SceneSize;

void main()
{

    float d = distance(Point, v_vTexcoord.xy * SceneSize);
    if (d < Radius) {
        float alpha = (Radius - d) * 0.5;
        alpha = min(alpha, 1.0);
        gl_FragColor = vec4(FillColor, alpha);
    } else {
        gl_FragColor = vec4(0.5, 0.5, 0.5, 0.0);
    }
    
}
