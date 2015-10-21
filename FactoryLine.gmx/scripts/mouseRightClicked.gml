///mouseRightClicked( id );
//Return true if object was clicked

if ( mouse_check_button_pressed( mb_right ) ) {
    if ( instance_position( mouse_x, mouse_y, argument0 ) ) {
        return true;
    }
}

return false;

