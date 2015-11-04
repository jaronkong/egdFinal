///itemExists( item )
///Check if an item is valid and loaded

var aItem = argument0;

if ( is_real( aItem ) ) {
    return ( aItem >= 0 );
}

with ( itemManager ) {
    var tPos = ds_grid_value_x( items, 0, Item.tag,
        ds_grid_width( items ), Item.tag, aItem );
    return ( tPos >= 0 );
}

return false;
