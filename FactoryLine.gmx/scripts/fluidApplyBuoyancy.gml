///fluidApplyBuoyancy( surface velocity, surface temperature, surface density, surface dest );

var aVelocity = argument0;
var aTemperature = argument1;
var aDensity = argument2;
var aDest = argument3;

var targetShader = fluidBuoyancy_sdr;

var temperatureTexture = shader_get_sampler_index(targetShader, "Temperature");
var inkTexture = shader_get_sampler_index(targetShader, "Density");

var ambTemp = shader_get_uniform(targetShader, "AmbientTemperature");
var timeStep = shader_get_uniform( targetShader, "TimeStep" );
var sigma = shader_get_uniform( targetShader, "Sigma" );
var kappa = shader_get_uniform( targetShader, "Kappa" );

//draw_surface_stretched( aTemperature, 200, 500, 100, 50 );

shader_set( targetShader );

    texture_set_stage( temperatureTexture, surface_get_texture( aTemperature ));
    texture_set_stage( inkTexture, surface_get_texture( aDensity ));
    
    shader_set_uniform_f( ambTemp, global.ambientTemperature );
    shader_set_uniform_f( timeStep, global.fluidTimestep );
    shader_set_uniform_f( sigma, global.smokeBuoyancy );
    shader_set_uniform_f( kappa, global.smokeWeight );
    
    surface_set_target( aDest );
        draw_surface( aVelocity, 0, 0 );
    surface_reset_target();
shader_reset();