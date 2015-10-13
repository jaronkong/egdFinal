///createPlaceableItem( x, y, object_index heldObject);

var aHeldItem = argument2;

var tNewItem = instance_create( argument0, argument1, placeableItem );

with ( tNewItem ) {
    heldItem = aHeldItem;
    image = object_get_sprite(heldItem);
}

return tNewItem;

