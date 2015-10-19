///recipeResult( mathod, item0, ..., itemN )
//Get the result of a recipe

var aRecipe = argument[0];
for ( var i = 1; i < argument_count; ++i ) {
    aRecipe += "+" + itemProperty( argument[i], Item.tag );
}

with ( itemManager ) {
    if ( ds_map_exists( recipes, aRecipe ) ) {
        return itemFromTag( ds_map_find_value( recipes, aRecipe ) );
    }
}

return itemFromTag( "garbage" );
