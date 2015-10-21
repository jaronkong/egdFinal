///fluidSubtractGradient( surface velocity, surface pressure, surface obstacles, surface dest );

var aVelocity = argument0;
var aPressure = argument1;
var aObstacles = argument2;
var aDest = argument3;

var targetShader = fluidSubtractGradient_sdr;


var gradientScale = shader_get_uniform(targetShader, "GradientScale");
var halfCell = shader_get_uniform(targetShader, "HalfInverseCellSize");
var invScreenSize = shader_get_uniform(targetShader, "InvScreenSize");

var pressureSample = shader_get_sampler_index( targetShader, "Pressure" );
var obstaclesSample = shader_get_sampler_index( targetShader, "Obstacles" );

shader_set( targetShader );

    shader_set_uniform_f( gradientScale, global.gradientScale );
    shader_set_uniform_f( halfCell, 0.5 / global.cellSize );
    shader_set_uniform_f( invScreenSize, 1 / global.fluidWidth , 1 / global.fluidHeight );
    
    texture_set_stage(pressureSample, surface_get_texture( aPressure ));
    texture_set_stage(obstaclesSample, surface_get_texture( aObstacles ));

    surface_set_target( aDest );
        draw_surface( aVelocity, 0, 0 );
    surface_reset_target();

shader_reset();