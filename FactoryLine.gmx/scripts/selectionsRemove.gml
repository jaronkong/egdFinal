///selectionsRemove( interactiveBlock id);

with ( selectionController ) {
    ds_list_delete( selectionList, ds_list_find_index( selectionList, argument0 ) );
}

