///removeElement( id );
//ID must be a block
with ( argument0 ) {
    instance_destroy();
    audio_play_sound( removeElement_sd, 1, false );
    with ( originTraySection ) {
        //Refund the item quantity
        if ( heldItemQuantity >= 0 ) {
            heldItemQuantity += 1;
        }
    }

}

