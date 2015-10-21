///selectionAdd( interactiveBlock id );

var aBlock = argument0

with ( selectionController ) {
    if ( ds_list_find_index( selectionList, aBlock ) < 0 ) {
        //Make sure not already added
        ds_list_add( selectionList, aBlock );
        
    }
}
