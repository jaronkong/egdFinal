///increaseRestrictionLevel( newLevel );

var MAX_LEVEL = 2; //The actual number on the last file, NOT the number of files

with ( restrictionController ) {
    if ( argument0 < MAX_LEVEL ) {
        restrictionFileName = "restrictions_" + string( argument0 ) + ".dat";
    }
    restrictionTimer = room_speed * 3;
    event_user( 0 );
}

