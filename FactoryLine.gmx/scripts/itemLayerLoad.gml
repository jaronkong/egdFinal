///itemLayerLoad( tag )
//Get an item layer from the tag

var aTag = argument0;

with ( itemManager ) {
    var tIndex = ds_grid_value_x( layers, 0, ItemLayer.tag,
        ds_grid_width( layers ), ItemLayer.tag, aTag );
    
    if ( tIndex < 0 ) {
        tIndex = ds_grid_width( layers );
        ds_grid_resize( layers, ( tIndex + 1 ), ItemLayer.count );
        
        layers[# tIndex, ItemLayer.tag] = aTag;
        layers[# tIndex, ItemLayer.sprite] = asset_get_index(
            ini_read_string( aTag, "sprite", "" ) );
        layers[# tIndex, ItemLayer.x] = ini_read_real( aTag, "x", 0 );
        layers[# tIndex, ItemLayer.y] = ini_read_real( aTag, "y", 0 );
        layers[# tIndex, ItemLayer.scale] = ini_read_real( aTag, "s", 1 );
        layers[# tIndex, ItemLayer.color] = ini_read_real( aTag, "color", true );
        layers[# tIndex, ItemLayer.mirror] = ini_read_real( aTag, "mirror", false );
    }
    
    return tIndex;
}

return -1;
