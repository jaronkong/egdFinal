///itemDraw( item, x, y, xscale, yscale )

var aItem = argument0;
var aPosX = argument1;
var aPosY = argument2;
var aScaleX = argument3;
var aScaleY = argument4;

var tItem = itemFromTag( aItem );
var tSprite = itemProperty( tItem, Item.sprite );

draw_sprite_ext( tSprite, 0, aPosX, aPosY, aScaleX, aScaleY, 0, c_white, 1 );

var tLayers = itemProperty( tItem, Item.layers );
var tLayerData = itemManager.layers;
if ( is_array( tLayers ) ) {
    for ( var i = 0; i < array_length_1d( tLayers ); ++i ) {
        var tIndex = tLayers[i];
        draw_sprite_ext(
            tLayerData[#tIndex, ItemLayer.sprite], 0,
            aPosX + (tLayerData[#tIndex, ItemLayer.x] * aScaleX),
            aPosY + (tLayerData[#tIndex, ItemLayer.y] * aScaleY),
            aScaleX * tLayerData[#tIndex, ItemLayer.scale],
            aScaleY * tLayerData[#tIndex, ItemLayer.scale],
            0, c_white, 1 );
    }
}

draw_set_color( c_white );
draw_set_alpha( 1 );
draw_set_font( main_ft );
draw_set_halign( fa_center );
draw_set_valign( fa_middle );
draw_text( aPosX, aPosY - 20, itemProperty( tItem, Item.name ) );
