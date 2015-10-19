///recipeDefine( result, method, item0, ..., itemN )
//Define a recipe involving the items
//Order matters

var aResult = argument[0];
var aRecipe = argument[1];
for ( var i = 2; i < argument_count; ++i ) {
    aRecipe += "+" + itemProperty( argument[i], Item.tag );
}

with ( itemManager ) {
    ds_map_add( recipes, aRecipe, itemProperty( aResult, Item.tag ) );
}

return aRecipe;
