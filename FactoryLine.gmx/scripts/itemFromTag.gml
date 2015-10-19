///itemFromTag( tag )
///Get an itemID from the tag

with ( itemManager ) {
    var tPos = ds_grid_value_x( items, 0, Item.tag,
        ds_grid_height( items ), Item.tag, argument0 );
    if ( tPos >= 0 ) return tPos;
}

return -1;
