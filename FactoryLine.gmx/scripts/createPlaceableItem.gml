///createPlaceableItem( x, y, id heldInstance, tray originTray);

var aHeldItem = argument2;
var aOriginTraySection = argument3;

var tNewItem = instance_create( argument0, argument1, placeableItem );

with ( tNewItem ) {
    heldItem = aHeldItem;
   
    image = heldItem.sprite_index;
    heldStartX = heldItem.x;
    heldStartY = heldItem.y;
    originTraySection = aOriginTraySection;
    image_xscale = heldItem.image_xscale;
    image_yscale = heldItem.image_yscale;
    
    held = true;
    grabOffset = grabOffsetMax;
    audio_play_sound( craneSlam_sd, 1, false );
    
}

with ( aHeldItem ) {
    active = false;
}



return tNewItem;
