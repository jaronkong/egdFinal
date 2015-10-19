///fluidJacobi( surface pressure, surface divergence, surface obstacles, surface dest );

var aPressure = argument0;
var aDivergence = argument1;
var aObstacles = argument2;
var aDest = argument3;

var targetShader = fluidJacobi_sdr;


var alpha = shader_get_uniform(targetShader, "Alpha");
var inverseBeta = shader_get_uniform(targetShader, "InverseBeta");
var inverseScreenSize = shader_get_uniform(targetShader, "InvScreenSize");

var divergenceSample = shader_get_sampler_index( targetShader, "Divergence" );
var obstaclesSample = shader_get_sampler_index( targetShader, "Obstacles" );

shader_set( targetShader );

    //shader_set_uniform_f( alpha, -global.cellSize * global.cellSize );
    shader_set_uniform_f( alpha, 1.25);
    shader_set_uniform_f( inverseBeta, 0.25 );
    shader_set_uniform_f( inverseScreenSize, 1 / global.fluidWidth , 1 / global.fluidHeight );
    
    texture_set_stage(divergenceSample, surface_get_texture( aDivergence ));
    texture_set_stage(obstaclesSample, surface_get_texture( aObstacles ));

    surface_set_target( aDest );
        draw_surface( aPressure, 0, 0 );
    surface_reset_target();

shader_reset();
