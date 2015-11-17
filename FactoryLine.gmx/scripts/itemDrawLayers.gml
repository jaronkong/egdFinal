///itemDrawLayers( item, x, y, set, [frame], [color], [xscale, yscale] )

var aItem = argument[0];
var aPosX = argument[1];
var aPosY = argument[2];
var aSet = argument[3];

var aFrame = 0;
if ( argument_count >= 5 ) {
    aFrame = argument[4];
}

var aColor = c_white;
if ( argument_count >= 6 ) {
    aColor = argument[5];
}

var aScaleX = 1;
var aScaleY = 1;
if ( argument_count >= 8 ) {
    aScaleX = argument[6];
    aScaleY = argument[7];
}

var tItem = itemFromTag( aItem );
var tLayers = itemProperty( tItem, aSet );

var tLayerData = itemManager.layers;
if ( is_array( tLayers ) ) {
    for ( var i = 0; i < array_length_1d( tLayers ); ++i ) {
        var tIndex = tLayers[i];
        var tSprite = tLayerData[#tIndex, ItemLayer.sprite];
        var tScaleX = ( aScaleX * tLayerData[#tIndex, ItemLayer.scale] );
        if ( tLayerData[#tIndex, ItemLayer.mirror] ) {
            tScaleX = -tScaleX;
        }
        var tColor = aColor;
        if ( !tLayerData[#tIndex, ItemLayer.color] ) {
            tColor = c_white;
        }
        var tSpeed = tLayerData[#tIndex, ItemLayer.speed]
        var tFrame = floor( aFrame * tSpeed );
        if ( tSpeed < 0 ) {
            if ( ( abs( tFrame ) % abs( tSpeed * 15 ) ) < 1 ) {
                tFrame = 1;
            } else {
                tFrame = 0;
            }
        }
        draw_sprite_ext(
            tSprite, ( tFrame % sprite_get_number( tSprite ) ),
            aPosX + (tLayerData[#tIndex, ItemLayer.x] * aScaleX),
            aPosY + (tLayerData[#tIndex, ItemLayer.y] * aScaleY),
            tScaleX, (aScaleY * tLayerData[#tIndex, ItemLayer.scale]),
            0, tColor, 1 );
    }
}
