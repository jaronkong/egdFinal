///createPlaceableItem( x, y, id heldInstance, tray originTray);

var aHeldItem = argument2;
var aOriginTraySection = argument3;

var tNewItem = instance_create( argument0, argument1, placeableItem );

with ( tNewItem ) {
    heldItem = aHeldItem;
    image = heldItem.sprite_index;
    originTraySection = aOriginTraySection;
}

with ( aHeldItem ) {
    active = false;
}



return tNewItem;

