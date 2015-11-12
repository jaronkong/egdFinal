///itemDrawLayers( item, x, y, set, [color], [xscale, yscale] )

var aItem = argument[0];
var aPosX = argument[1];
var aPosY = argument[2];
var aSet = argument[3];

var aColor = c_white;
if ( argument_count >= 5 ) {
    aColor = argument[4];
}

var aScaleX = 1;
var aScaleY = 1;
if ( argument_count >= 7 ) {
    aScaleX = argument[5];
    aScaleY = argument[6];
}

var tItem = itemFromTag( aItem );
var tLayers = itemProperty( tItem, aSet );

var tLayerData = itemManager.layers;
if ( is_array( tLayers ) ) {
    for ( var i = 0; i < array_length_1d( tLayers ); ++i ) {
        var tIndex = tLayers[i];
        var tScaleX = ( aScaleX * tLayerData[#tIndex, ItemLayer.scale] );
        if ( tLayerData[#tIndex, ItemLayer.mirror] ) {
            tScaleX = -tScaleX;
        }
        var tColor = aColor;
        if ( !tLayerData[#tIndex, ItemLayer.color] ) {
            tColor = c_white;
        }
        draw_sprite_ext(
            tLayerData[#tIndex, ItemLayer.sprite], 0,
            aPosX + (tLayerData[#tIndex, ItemLayer.x] * aScaleX),
            aPosY + (tLayerData[#tIndex, ItemLayer.y] * aScaleY),
            tScaleX, (aScaleY * tLayerData[#tIndex, ItemLayer.scale]),
            0, tColor, 1 );
    }
}
