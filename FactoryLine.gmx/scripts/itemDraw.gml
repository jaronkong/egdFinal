///itemDraw( item, x, y, xscale, yscale )

var aItem = argument0;
var aPosX = argument1;
var aPosY = argument2;
var aScaleX = argument3;
var aScaleY = argument4;

var tItem = itemFromTag( aItem );
var tSprite = itemProperty( tItem, Item.sprite );

draw_sprite_ext( tSprite, 0, aPosX, aPosY, aScaleX, aScaleY, 0, c_white, 1 );
