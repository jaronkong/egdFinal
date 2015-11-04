///recipeExists( method, item0, ..., itemN )
//Check if a recipe is defined

var aRecipe = argument[0];
for ( var i = 1; i < argument_count; ++i ) {
    aRecipe += "+" + itemProperty( argument[i], Item.tag );
}

with ( itemManager ) {
    if ( ds_map_exists( recipes, aRecipe ) ) {
        return true;
    }
}

return false;
