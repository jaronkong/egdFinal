///itemDraw( item, x, y, xscale, yscale )

var aItem = argument0;
var aPosX = argument1;
var aPosY = argument2;
var aScaleX = argument3;
var aScaleY = argument4;

var tItem = itemFromTag( aItem );
var tSprite = itemProperty( tItem, Item.sprite );

draw_sprite_ext( tSprite, 0, aPosX, aPosY, aScaleX, aScaleY, 0, c_white, 1 );

draw_set_color( c_white );
draw_set_alpha( 1 );
draw_set_font( main_ft );
draw_set_halign( fa_center );
draw_set_valign( fa_middle );
draw_text( aPosX, aPosY - 20, itemProperty( tItem, Item.name ) );
