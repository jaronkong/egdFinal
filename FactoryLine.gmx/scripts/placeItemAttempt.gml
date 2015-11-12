///placeItemAttempt( placeableItem id );

var aDragItem = argument0;

if ( instance_exists( aDragItem ) ) {
    var tHeldBlock = aDragItem.heldItem;
    var tTargetX = aDragItem.targetX;
    var tTargetY = aDragItem.targetY;
    var tStartX = aDragItem.heldStartX;
    var tStartY = aDragItem.heldStartY;

    if ( isPlaceableLocation( tTargetX, tTargetY, tHeldBlock ) ) {
        //If can place where want to place, then do it
        with ( aDragItem ) {
            if ( held ) {
                //Releasing item
                audio_play_sound( placeItem_sd, 1, false );
                shakeElement( heldItem, 2 );
                with ( heldItem ) {
                    x = tTargetX;
                    y = tTargetY;
                    instance_create( x, y, smokePoof );
                    instance_create( x, y, sparkBurst );
                    originTraySection = other.originTraySection;
                    active = true;
                }
                instance_destroy();
            }
            held = false;
        }
    }
    else if ( isPlaceableLocation( tStartX, tStartY, tHeldBlock ) ) {
        //Otherwise check if we can put it back where we found it
        with ( aDragItem ) {
            if ( held ) {
                //Releasing item
                audio_play_sound( placementFail_sd, 1, false );
                shakeElement( heldItem, 2 );
                with ( heldItem ) {
                    x = tStartX;
                    y = tStartY;
                    originTraySection = other.originTraySection;
                    active = true;
                }
                instance_destroy();
            }
            held = false;
        }
    }
    else {
        //If can't fit piece anywhere, return it to the tray
        with ( aDragItem ) {
            with ( heldItem ) {
                instance_destroy();
            }
            
            with ( originTraySection ) {
                //Refund the item quantity
                if ( heldItemQuantity >= 0 ) {
                    heldItemQuantity += 1;
                }
            }
            audio_play_sound( placementFail_sd, 1, false );
            instance_destroy();

        }
    }
}
