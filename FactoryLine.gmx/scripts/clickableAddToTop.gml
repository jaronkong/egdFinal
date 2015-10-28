///clickableAddToTop( id );

var aID = argument0;

with ( inputMaskingController ) {
    var tIndex = ds_list_find_index( clickableList, aID );
    if ( tIndex >= 0 ) {
        //Object already exists, move to front of list
        ds_list_delete( clickableList, tIndex );
        ds_list_add( clickableList, aID );
    }
    else {
        ds_list_add( clickableList, aID );
    }
}

