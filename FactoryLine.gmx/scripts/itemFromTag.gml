///itemFromTag( tag )
///Get an itemID from the tag

var aItem = argument0;

if ( is_real( aItem ) ) {
    return aItem;
}

with ( itemManager ) {
    var tPos = ds_grid_value_x( items, 0, Item.tag,
        ds_grid_width( items ), Item.tag, aItem );
    if ( tPos >= 0 ) return tPos;
}

return itemLoad( aItem );
