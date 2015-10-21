///fluidDrawFinal( surface drawSurface);

var aDrawSurface = argument0;

var targetShader = fluidVisualize_sdr;
    
var fillColor = shader_get_uniform( targetShader, "FillColor" );
var endColor = shader_get_uniform( targetShader, "EndColor" );
var scale = shader_get_uniform( targetShader, "Scale" );
    
//draw_surface_stretched( aSource, 100, 600, 100, 50 );

shader_set( targetShader );
    
    shader_set_uniform_f( fillColor, 0.05, 0.05, 1.0 );
    shader_set_uniform_f( endColor, 1.0, 1.0, 0.0 );
    shader_set_uniform_f( scale, 1 / global.fluidWidth, 1 / global.fluidHeight );

    draw_surface( aDrawSurface, 0, 0 );


shader_reset();



