///fluid_computeFlow( surface fluidState, surface fluidFlow);

var aFluidState = argument0;
var aFluidFlow = argument1;

if ( surface_exists( aFluidState ) && surface_exists( aFluidFlow ) ) {
   
    var tTargetShader = fluid_computeFlow_sdr;
    var s_invScreenSize = shader_get_uniform( tTargetShader, "invScreenSize" );
    var s_stateMap = shader_get_sampler_index( tTargetShader, "stateMap");
    
    //shader_set_uniform_f( s_invScreenSize, 
    //                1/surface_get_width( aFluidState ), 
    //                1/surface_get_height( aFluidState ));
    
    
    shader_set( tTargetShader );
    
    shader_set_uniform_f( s_invScreenSize, 
                    global.fluidSpeed/surface_get_width( aFluidState ), 
                    global.fluidSpeed/surface_get_height( aFluidState ));
                            
    texture_set_stage( s_stateMap, aFluidState );
    
    surface_set_target( aFluidFlow );
        draw_clear_alpha( c_black, 0 );
        draw_surface_stretched( aFluidState, 0, 0, 
                    surface_get_width( aFluidFlow ),
                    surface_get_height( aFluidFlow ) );
    
    surface_reset_target();
    shader_reset();

    
}
