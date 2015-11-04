///itemDefine( tag, name, sprite, subimages )

var aTag = argument[0];
var aName = argument[1];
var aSprite = argument[2];
var aLayers = -1;

if ( argument_count > 3 ) {
    aLayers = argument[4];
} else {
    aLayers = ds_grid_create( 1, ItemLayer.count );
    ds_grid_set( aLayers, 0, ItemLayer.sprite, garbage_spr );
    ds_grid_set( aLayers, 0, ItemLayer.x, 0 );
    ds_grid_set( aLayers, 0, ItemLayer.y, 8 );
    ds_grid_set( aLayers, 0, ItemLayer.scale, 0.25 );
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
    } else {
        var tLayers = items[# tIndex, Item.layers];
        if ( ds_exists( tLayers, ds_type_grid ) ) {
            ds_grid_destroy( tLayers );
        }
    }
    ds_grid_set( items, tIndex, Item.tag, aTag );
    ds_grid_set( items, tIndex, Item.name, aName );
    ds_grid_set( items, tIndex, Item.sprite, aSprite );
    ds_grid_set( items, tIndex, Item.layers, aLayers );
}

return tIndex;
