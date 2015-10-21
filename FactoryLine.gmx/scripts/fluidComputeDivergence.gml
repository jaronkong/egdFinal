///fluidComputeDivergence( surface velocity, surface obstacles, surface dest );

var aVelocity = argument0;
var aObstacles = argument1;
var aDest = argument2;

var targetShader = fluidComputeDivergence_sdr;


var halfCell = shader_get_uniform(targetShader, "HalfInverseCellSize");
var invScreenSize = shader_get_uniform(targetShader, "InvScreenSize");

var sampler = shader_get_sampler_index( targetShader, "Obstacles" );

shader_set( targetShader );

    shader_set_uniform_f( halfCell, 0.5 / global.cellSize );
    shader_set_uniform_f( invScreenSize, 1 / global.fluidWidth , 1 / global.fluidHeight );
    
    texture_set_stage(sampler, surface_get_texture( aObstacles ));

    surface_set_target( aDest );
        draw_surface( aVelocity, 0, 0 );
    surface_reset_target();

shader_reset();