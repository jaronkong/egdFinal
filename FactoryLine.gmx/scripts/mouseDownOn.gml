///mouseDownOn( id );
//Return true if object has mouse down on it

if ( mouse_check_button( mb_left ) ) {
    if ( instance_position( mouse_x, mouse_y, argument0 ) ) {
        return true;
    }
}

return false;

