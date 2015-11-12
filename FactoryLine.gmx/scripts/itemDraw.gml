///itemDraw( item, x, y, [color], [xscale], [yscale] )

var aItem = argument[0];
var aPosX = argument[1];
var aPosY = argument[2];

var aColor = c_white;
if ( argument_count >= 4 ) {
    aColor = argument[3];
}

var aScaleX = 1;
var aScaleY = 1;
if ( argument_count >= 6 ) {
    aScaleX = argument[4];
    aScaleY = argument[5];
}

var tItem = itemFromTag( aItem );
var tSprite = itemProperty( tItem, Item.sprite );
var tScale = itemProperty( tItem, Item.scale );
var tColor = aColor;
if ( !itemProperty( tItem, Item.color ) ) {
    tColor = c_white;
}

draw_sprite_ext( tSprite, 0, aPosX, aPosY, aScaleX*tScale, aScaleY*tScale, 0, tColor, 1 );

var tLayers = itemProperty( tItem, Item.layers );
var tLayerData = itemManager.layers;
if ( is_array( tLayers ) ) {
    for ( var i = 0; i < array_length_1d( tLayers ); ++i ) {
        var tIndex = tLayers[i];
        var tColor = aColor;
        if ( !tLayerData[#tIndex, ItemLayer.color] ) {
            tColor = c_white;
        }
        draw_sprite_ext(
            tLayerData[#tIndex, ItemLayer.sprite], 0,
            aPosX + (tLayerData[#tIndex, ItemLayer.x] * aScaleX),
            aPosY + (tLayerData[#tIndex, ItemLayer.y] * aScaleY),
            aScaleX * tLayerData[#tIndex, ItemLayer.scale],
            aScaleY * tLayerData[#tIndex, ItemLayer.scale],
            0, tColor, 1 );
    }
}

draw_set_color( c_white );
draw_set_alpha( 1 );
draw_set_font( main_ft );
draw_set_halign( fa_center );
draw_set_valign( fa_middle );
draw_text( aPosX, aPosY - 20*aScaleY, itemProperty( tItem, Item.name ) );
