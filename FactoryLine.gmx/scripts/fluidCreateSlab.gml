///fluidCreateSlab( name, width, height );

var aName = argument0
var aWidth = argument1;
var aHeight = argument2;

var newSlab = instance_create( 0, 0, fluidSlab );

with ( newSlab ) {
    name = aName;
    width = aWidth;
    height = aHeight;
    
    ping = surface_create( width, height );
    
    surface_set_target( ping );
        draw_clear_alpha( make_color_rgb( 127.5, 127.5, 127.5), 1.0 );
    surface_reset_target();
    
    pong = surface_create( width, height );
    
    surface_set_target( pong );
        draw_clear_alpha( make_color_rgb( 127.5, 127.5, 127.5), 1.0 );
    surface_reset_target();
    
}

return newSlab;