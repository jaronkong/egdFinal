///mouseReleased( id );
//Return true if object was released clicked

if ( mouse_check_button_released( mb_left ) ) {
    if ( instance_position( mouse_x, mouse_y, argument0 ) ) {
        return true;
    }
}

return false;
