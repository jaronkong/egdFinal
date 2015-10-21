///fluid_applyFlowToNewState( surface stageSurface, surface fluidFlow, surface prevFluidState);

var aTargetStage = argument0;
var aFluidFlow = argument1;
var aPrevFluidState = argument2;

if ( surface_exists( aTargetStage ) && surface_exists( aFluidFlow ) && surface_exists( aPrevFluidState ) ) {
    var s_prevStateMap = shader_get_sampler_index( fluid_flowToState_sdr, "prevStateMap" );
    var s_invScreenSize = shader_get_uniform( fluid_flowToState_sdr, "invScreenSize" );
    
    shader_set( fluid_flowToState_sdr );
        shader_set_uniform_f( s_invScreenSize, 
                    global.fluidSpeed/surface_get_width( aPrevFluidState ), 
                    global.fluidSpeed/surface_get_height( aPrevFluidState ));  
                    
        texture_set_stage( s_prevStateMap, aPrevFluidState );

        surface_set_target( aTargetStage );

            draw_surface_stretched(aFluidFlow, view_xview, view_yview, 
                        view_wview, 
                        view_hview);
        surface_reset_target();
    
    shader_reset();
    
    
}