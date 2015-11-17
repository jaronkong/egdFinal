///itemDefine( tag, name, sprite, back, scale, speed, color, [above, below] )

var aTag = argument[0];
var aName = argument[1];
var aSprite = argument[2];
var aBack = argument[3]
var aScale = argument[4];
var aSpeed = argument[5];
var aColor = argument[6];
var aLayersF = undefined;
var aLayersB = undefined;
if ( argument_count > 8 ) {
    aLayersF = argument[7];
    aLayersB = argument[8];
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
    ds_grid_set( items, tIndex, Item.back, aBack );
    ds_grid_set( items, tIndex, Item.scale, aScale );
    ds_grid_set( items, tIndex, Item.speed, aSpeed );
    ds_grid_set( items, tIndex, Item.color, aColor );
    ds_grid_set( items, tIndex, Item.above, aLayersF );
    ds_grid_set( items, tIndex, Item.below, aLayersB );
}

return tIndex;
