///recipeDefine( result, method, item0, ..., itemN )
//Define a recipe involving the items
//Order matters

var aResult = argument[0];
var aRecipe = argument[1];
for ( var i = 2; i < argument_count; ++i ) {
    if ( is_string( argument[i] ) ) {
        aRecipe += "+" + itemProperty( argument[i], Item.tag );
    } else if ( is_array( argument[i] ) ) {
        var tArray = argument[i];
        for ( var j = 0; j < array_length_1d( tArray ); ++j ) {
            aRecipe += "+" + itemProperty( tArray[j], Item.tag );
        }
    }
}

with ( itemManager ) {
    ds_map_add( recipes, aRecipe, itemProperty( aResult, Item.tag ) );
}

return aRecipe;