///restrictionCreate( sourcefile, sections, weights );

var aFile = argument0;
var aSections = argument1;
var aWeights = argument2;
var tRestrictionString = chooseWeight( aSections, aWeights );

ini_open( aFile );
//Decide which type of restriction
var tRestrictionType = asset_get_index( ini_read_string( tRestrictionString, "obj", "") );
var tRestrictionText = ini_read_string( tRestrictionString, "text", ""); //A string
var tRestrictionFlag = ini_read_string( tRestrictionString, "flag", "");
var tRestrictionAmount = ini_read_real( tRestrictionString, "amount", 0 );

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
    flag = tRestrictionFlag;
    amount = tRestrictionAmount;
    event_user( 0 );
}


