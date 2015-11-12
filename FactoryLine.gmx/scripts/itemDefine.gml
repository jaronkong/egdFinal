///itemDefine( tag, name, sprite, scale, color, [subimages] )

var aTag = argument[0];
var aName = argument[1];
var aSprite = argument[2];
var aScale = argument[3];
var aColor = argument[4];
var aLayers = undefined;
if ( argument_count > 5 ) {
    aLayers = argument[5];
}

if ( !sprite_exists( aSprite ) ) {
    aSprite = item_spr;
}

with ( itemManager ) {
    var tIndex = ds_grid_value_x( items, 0, Item.tag,
        ds_grid_width( items ), Item.tag, aTag );
    if ( tIndex < 0 ) {
        tIndex = ds_grid_width( items );
        ds_grid_resize( items, ( tIndex + 1 ), ds_grid_height( items ) );
    }
    ds_grid_set( items, tIndex, Item.tag, aTag );
    ds_grid_set( items, tIndex, Item.name, aName );
    ds_grid_set( items, tIndex, Item.sprite, aSprite );
    ds_grid_set( items, tIndex, Item.scale, aScale );
    ds_grid_set( items, tIndex, Item.color, aColor );
    ds_grid_set( items, tIndex, Item.layers, aLayers );
}

return tIndex;
