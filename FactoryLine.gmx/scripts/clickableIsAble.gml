///clickableIsAble( id );
//Get if the item is clickable.

var aID = argument0;

with ( inputMaskingController ) {
    for ( var i = ds_list_size( clickableList ) - 1; i >= 0; --i ) {
        var tCurrentInstance = clickableList[| i];
        if ( instance_position( mouse_x, mouse_y, tCurrentInstance ) && tCurrentInstance != aID) {
            return false;
        }
        else {
            return true;
        }
    }
}

return true;

