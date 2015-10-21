///fluid_drawCircleBlob( surface prep, surface fluidState);

var aPrep = argument0;
var aFluidState = argument1;

if ( surface_exists( aPrep ) ) {
    surface_set_target( aPrep );
        draw_set_color( c_lime );
        draw_set_alpha( 1 );
        draw_circle( mouse_x, mouse_y, 32, false );
    surface_reset_target();
}
if ( surface_exists( aFluidState ) ) {    
    surface_set_target( aFluidState );
    draw_clear_alpha( c_black, 0 );
    shader_set( fluid_initState_sdr );
        draw_surface_stretched( aPrep, 0, 0, surface_get_width( aFluidState ), surface_get_height( aFluidState ) );
    shader_reset();
    surface_reset_target();
}