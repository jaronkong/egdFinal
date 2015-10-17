///createPlaceableItem( x, y, id heldInstance);

var aHeldItem = argument2;

var tNewItem = instance_create( argument0, argument1, placeableItem );

with ( tNewItem ) {
    heldItem = aHeldItem;
    image = heldItem.sprite_index;
}



return tNewItem;

