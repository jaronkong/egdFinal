///itemDefine( tag, name, sprite )

var aTag = argument0;
var aName = argument1;
var aSprite = argument2;

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
}

return tIndex;
