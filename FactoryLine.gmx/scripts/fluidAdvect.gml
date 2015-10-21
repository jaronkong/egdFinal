///fluidAdvect( surface velocity, surface source, surface obstacles, surface dest, float dissipation );

var aVelocity = argument0;
var aSource = argument1;
var aObstacles = argument2;
var aDest = argument3;
var aDissipation = argument4;

var targetShader = fluidAdvect_sdr;

    var inverseSize = shader_get_uniform(targetShader, "InverseSize");
    var timeStep = shader_get_uniform( targetShader, "TimeStep" );
    var dissLoc = shader_get_uniform( targetShader, "Dissipation" );
    
    var sourceTexture = shader_get_sampler_index(targetShader, "SourceTexture");
    var obstaclesTexture = shader_get_sampler_index(targetShader, "Obstacles");

//draw_surface_stretched( aSource, 100, 600, 100, 50 );

shader_set( targetShader );
    
    shader_set_uniform_f( inverseSize, 1 / global.fluidWidth , 1 / global.fluidHeight );
    shader_set_uniform_f( timeStep, global.fluidTimestep );
    shader_set_uniform_f( dissLoc, aDissipation );

    texture_set_stage( sourceTexture, surface_get_texture( aSource ));
    texture_set_stage( obstaclesTexture, surface_get_texture( aObstacles ));


    surface_set_target( aDest );
        draw_surface( aVelocity, 0, 0 );
    surface_reset_target();

shader_reset();
