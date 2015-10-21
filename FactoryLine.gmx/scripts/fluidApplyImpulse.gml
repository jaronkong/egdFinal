///fluidApplyImpulse( surface dest, posX, posY, colorValue );

var aDest = argument0;
var aPosX = argument1;
var aPosY = argument2;
var aColorValue = argument3;

var targetShader = fluidSplat_sdr;

var pointLoc = shader_get_uniform(targetShader, "Point");
var sceneSize = shader_get_uniform( targetShader, "SceneSize" );
var radiusLoc = shader_get_uniform( targetShader, "Radius" );
var fillColorLoc = shader_get_uniform( targetShader, "FillColor" );

shader_set( targetShader );

    shader_set_uniform_f( pointLoc, aPosX, aPosY );
    shader_set_uniform_f( sceneSize, global.fluidWidth, global.fluidHeight );
    shader_set_uniform_f( radiusLoc, global.splatRadius );
    shader_set_uniform_f( fillColorLoc, aColorValue, aColorValue, aColorValue );
    
    //var tempSurface = surface_create( global.fluidWidth, global.fluidHeight );
    
    //surface_set_target( aDest );
    //    draw_surface( tempSurface, 0, 0 );
    //surface_reset_target();
    
    //surface_free( tempSurface );
shader_reset();

surface_set_target( aDest );
    draw_set_color( make_color_rgb( 255, 255, 255 ) );
    draw_circle( 300, 400, 64, false );
surface_reset_target();
