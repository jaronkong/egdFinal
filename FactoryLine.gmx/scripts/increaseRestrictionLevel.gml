///increaseRestrictionLevel( newLevel );

var MAX_LEVEL = 4; //The actual number on the last file, NOT the number of files

with ( restrictionController ) {
    if ( argument0 < MAX_LEVEL ) {
        restrictionFileName = "restrictions_" + string( argument0 ) + ".dat";
    }
    restrictionTimer = room_speed * 3;
    event_user( 0 );
    
    var tNewRestriction = instance_create( 0, 0, restrictionQuotaAdd );
    var tSpawnWidthRange = 500;
    var tNewLetter = instance_create( random( tSpawnWidthRange ), room_height / 2, restrictionDoc );
    
    
    //Set the letter's text and attach it to the restriction we just made
    with ( tNewLetter ) {
    text = "Commence production on# {ITEM}";
    restrictionCon = tNewRestriction;

    sprite_index = document_spr;
    
    }
    with ( tNewRestriction ) {
        attachedLetter = tNewLetter;
        flag = "random4";
        amount = 0;
        event_user( 0 );
    }

    
}

