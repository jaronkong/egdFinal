///itemLayerLoad( item, tag )
//Get an item layer from the tag

var aItem = argument0;
var aTag = string( argument1 );

var tParent = aItem;
var tTag = ( aItem + "-" + aTag );

with ( itemManager ) {
    var tIndex = ds_grid_value_x( layers, 0, ItemLayer.tag,
        ds_grid_width( layers ), ItemLayer.tag, tTag );
    
    if ( tIndex < 0 ) {
        tIndex = ds_grid_width( layers );
        ds_grid_resize( layers, ( tIndex + 1 ), ItemLayer.count );
        
        layers[# tIndex, ItemLayer.tag] = tTag;
        layers[# tIndex, ItemLayer.sprite] = asset_get_index( ini_read_string(
            tTag, "sprite", ini_read_string( tParent, "sprite", "" ) ) );
        layers[# tIndex, ItemLayer.x] = ini_read_real(
            tTag, "x", ini_read_real( tParent, "x", 0 ) );
        layers[# tIndex, ItemLayer.y] = ini_read_real(
            tTag, "y", ini_read_real( tParent, "y", 0 ) );
        layers[# tIndex, ItemLayer.scale] = ini_read_real(
            tTag, "s", ini_read_real( tParent, "s", 1 ) );
        layers[# tIndex, ItemLayer.color] = ini_read_real(
            tTag, "color", ini_read_real( tParent, "color", true ) );
        layers[# tIndex, ItemLayer.mirror] = ini_read_real(
            tTag, "mirror", ini_read_real( tParent, "mirror", false ) );
    }
    
    return tIndex;
}

return -1;
