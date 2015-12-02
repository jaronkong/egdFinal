///increaseRestrictionLevel( newLevel );

with ( restrictionController ) {
    restrictionFileName = "restrictions_" + string( argument0 ) + ".dat";
    restrictionTimer = room_speed * 3;
    event_user( 0 );
}

