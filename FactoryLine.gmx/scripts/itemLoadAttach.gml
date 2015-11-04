///itemLoadAttach( base, attachments, counts, count )

var aBase = argument0;
var aAttach = argument1;
var aAttachCount = argument2;
var aCount = argument3;

var tTag = itemProperty( aBase, Item.tag );
var tName = itemProperty( aBase, Item.name );
var tSprite = itemProperty( aBase, Item.sprite );
var tLayers = ds_grid_create( 0, ItemLayer.count );

ini_open( working_directory + "/recipes/attachments.dat" );
for ( var i = 0; i < aCount; ++i ) {
    if ( aAttachCount[i] > 0 ) {
        tTag += "-" + string( aAttachCount[i] ) + itemProperty( aAttach[i], Item.tag );
        tName += "#" + string( aAttachCount[i] ) + " " + itemProperty( aAttach[i], Item.name );
    }
    for ( var j = 0; j < aAttachCount[i]; ++j ) {
        var tIndex = ds_grid_width( tLayers );
        ds_grid_resize( tLayers, ( tIndex + 1 ), ItemLayer.count );
        
        var tLayerTag = ( aAttach[i] + "-" + string( j ) );
        tLayers[# tIndex, ItemLayer.sprite] = asset_get_index(
            ini_read_string( tLayerTag, "sprite", "" ) );
        tLayers[# tIndex, ItemLayer.x] = ini_read_real( tLayerTag, "x", 0 );
        tLayers[# tIndex, ItemLayer.y] = ini_read_real( tLayerTag, "y", 0 );
        tLayers[# tIndex, ItemLayer.scale] = ini_read_real( tLayerTag, "s", 0 );
    }
}
ini_close( )

if ( ds_grid_width( tLayers ) <= 0 ) {
    ds_grid_destroy( tLayers );
    tLayers = -1;
}

return itemDefine( tTag, tName, tSprite, tLayers );
