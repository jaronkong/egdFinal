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

itemDrawLayers( tItem, aPosX, aPosY, Item.below, aColor, aScaleX, aScaleY );

var tSprite = itemProperty( tItem, Item.sprite );
var tScale = itemProperty( tItem, Item.scale );
var tColor = aColor;
if ( !itemProperty( tItem, Item.color ) ) {
    tColor = c_white;
}
draw_sprite_ext( tSprite, 0, aPosX, aPosY, aScaleX*tScale, aScaleY*tScale, 0, tColor, 1 );

itemDrawLayers( tItem, aPosX, aPosY, Item.above, aColor, aScaleX, aScaleY );

draw_set_color( c_white );
draw_set_alpha( 1 );
draw_set_font( main_ft );
draw_set_halign( fa_center );
draw_set_valign( fa_middle );
draw_text( aPosX, aPosY - 20*aScaleY, itemProperty( tItem, Item.name ) );
