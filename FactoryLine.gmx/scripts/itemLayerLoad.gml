///itemLayerLoad( item, tag, layer )
//Get an item layer from the tag

var aItem = argument0;
var aTag = string( argument1 );
var aLayer = argument2;

var tParent = aItem;
var tTag = ( aItem + "-" + aTag );

var tLayer = "";
if ( aLayer != "" ) {
    tLayer = ( aLayer + "-" );
}

with ( itemManager ) {
    var tIndex = ds_grid_value_x( layers, 0, ItemLayer.tag,
        ds_grid_width( layers ), ItemLayer.tag, ( tLayer + tTag ) );
    
    if ( tIndex < 0 ) {
        var tSprite = asset_get_index( ini_read_string( tParent, tLayer+"sprite", "" ) );
        if ( !sprite_exists( tSprite ) ) break;
        
        tIndex = ds_grid_width( layers );
        ds_grid_resize( layers, ( tIndex + 1 ), ItemLayer.count );
        
        layers[# tIndex, ItemLayer.tag] = ( tLayer + tTag );
        layers[# tIndex, ItemLayer.sprite] = tSprite;
        layers[# tIndex, ItemLayer.color] = ini_read_real( tParent, tLayer+"color", true );
        layers[# tIndex, ItemLayer.scale] = ini_read_real( tParent, "s", 1 )
        layers[# tIndex, ItemLayer.x] = ini_read_real( tTag, "x", 0 );
        layers[# tIndex, ItemLayer.y] = ini_read_real( tTag, "y", 0 );;
        layers[# tIndex, ItemLayer.mirror] = ini_read_real( tTag, "mirror", false );
    }
    
    return tIndex;
}

return -1;
