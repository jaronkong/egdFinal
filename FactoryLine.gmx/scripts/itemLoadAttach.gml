///itemLoadAttach( base, attachments, counts )

var aBase = argument0;
var aAttach = argument1;
var aAttachCount = argument2;
var aCount = ds_grid_height( aAttachCount );

var tTag = itemProperty( aBase, Item.tag );
var tName = itemProperty( aBase, Item.name );
var tSprite = itemProperty( aBase, Item.sprite );

for ( var i = 0; i < aCount; ++i ) {
    if ( aAttachCount[# 0, i] > 0 ) {
        tTag += "-" + string( aAttachCount[#0,i] ) + itemProperty( aAttach[i], Item.tag );
        tName += "#" + string( aAttachCount[#0,i] ) + " " + itemProperty( aAttach[i], Item.name );
    }
}

if ( itemExists( tTag ) ) {
    return itemFromTag( tTag );
}

//Load layers
var tLayers = undefined;
for ( var i = 0; i < aCount; ++i ) {
    for ( var j = 0; j < aAttachCount[# 0, i]; ++j ) {
        var tLayerTag = ( aAttach[i] + "-" + string( j ) );
        tLayers[array_length_1d(tLayers)] = itemLayerLoad( tLayerTag );
    }
}

return itemDefine( tTag, tName, tSprite, tLayers );
