///fluidClearSurface( surface );

var aInputSurface = argument0;

surface_set_target( aInputSurface );
    draw_clear_alpha( make_color_rgb( 127.5, 127.5, 127.5 ), 0.0 );
surface_reset_target();