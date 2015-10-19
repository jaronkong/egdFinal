///itemDefine( tag, name, sprite )

var aTag = argument0;
var aName = argument1;
var aSprite = argument2;

var tIndex = itemFromTag( aTag );

if ( tIndex < 0 ) {
    with ( itemManager ) {
        tIndex = ds_grid_width( items );
        ds_grid_resize( items, ( tIndex + 1 ), ds_grid_height( items ) );
        ds_grid_set( items, tIndex, Item.tag, aTag );
        ds_grid_set( items, tIndex, Item.name, aName );
        ds_grid_set( items, tIndex, Item.sprite, aSprite );
    }
}

return tIndex;
