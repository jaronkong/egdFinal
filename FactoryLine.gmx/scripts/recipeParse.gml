///recipeParse( str )
//Parse and load a recipe

var aInput = argument0;

var tPos, tStr = aInput;
var tResult, tMethod;
var tItem, tItemCount = 0;

//Get the result
tPos = string_pos( '=', tStr );
tResult = string_copy( tStr, 1, tPos-1 );
tStr = string_delete( tStr, 1, tPos );

//Get the method
tPos = string_pos( ':', tStr );
tMethod = string_copy( tStr, 1, tPos-1 );
tStr = string_delete( tStr, 1, tPos );

//Pull ingredients
tPos = string_pos( '+', tStr );
while ( tPos > 0 ) {
    tItem[tItemCount++] = string_copy( tStr, 1, tPos-1 );
    tStr = string_delete( tStr, 1, tPos );
    tPos = string_pos( '+', tStr );
}

//Get the last ingredient
tItem[tItemCount++] = tStr;

//Ensure all items are loaded
itemLoad( tResult );
for ( var i = 0; i < tItemCount; ++i ) {
    itemLoad( tItem[i] );
}

//Insert the recipe
recipeDefine( tResult, tMethod, tItem );