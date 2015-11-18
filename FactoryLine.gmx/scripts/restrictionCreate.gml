///restrictionCreate( );

var tRestrictionString = "singleCount";

ini_open( "restrictions.dat" );
//Decide which type of restriction
var tRestrictionType = asset_get_index( ini_read_string( tRestrictionString, "obj", "") );
var tRestrictionText = ini_read_string( tRestrictionString, "text", ""); //A string

ini_close();

//Make the restriction
var tNewRestriction = instance_create( 0, 0, tRestrictionType );

var tSpawnWidthRange = 500;
var tNewLetter = instance_create( random( tSpawnWidthRange ), room_height / 2, restrictionDoc );

//Set the letter's text and attach it to the restriction we just made
with ( tNewLetter ) {
    text = tRestrictionText;
}
with ( tNewRestriction ) {
    attachedLetter = tNewLetter;
}


