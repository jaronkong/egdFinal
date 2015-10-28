///recipeParse( str )
//Parse and load a recipe

var aInput = string_replace_all( argument0, " ", "" );

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

//Insert the recipe
recipeDefine( tResult, tMethod, tItem );
