///itemDefine( tag, name, sprite, [scale], [subimages] )

var aTag = argument[0];
var aName = argument[1];
var aSprite = argument[2];
var aScale = 1;
var aLayers = undefined;

if ( argument_count > 3 ) {
    aScale = argument[3];
    if ( argument_count > 4 ) {
        aLayers = argument[4];
    }
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
    ds_grid_set( items, tIndex, Item.layers, aLayers );
}

return tIndex;
