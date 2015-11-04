///itemLoadAttach( base, attachments, counts )

var aBase = argument0;
var aAttach = argument1;
var aAttachCount = argument2;
var aCount = array_length_1d( aAttachCount );

var tTag = itemProperty( aBase, Item.tag );
var tName = itemProperty( aBase, Item.name );
var tSprite = itemProperty( aBase, Item.sprite );

tName += "#";
for ( var i = 0; i < aCount; ++i ) {
    if ( aAttachCount[i] > 0 ) {
        tTag += "-" + string( aAttachCount[i] ) + itemProperty( aAttach[i], Item.tag );
        tName += " " + string( aAttachCount[i] ) + " " + itemProperty( aAttach[i], Item.name );
    }
}
tName += " ";

if ( itemExists( tTag ) ) {
    return itemFromTag( tTag );
}

//Load layers
var tLayers = undefined;
for ( var i = 0; i < aCount; ++i ) {
    for ( var j = 0; j < aAttachCount[i]; ++j ) {
        var tLayerTag = ( aAttach[i] + "-" + string( j ) );
        tLayers[array_length_1d(tLayers)] = itemLayerLoad( tLayerTag );
    }
}

return itemDefine( tTag, tName, tSprite, tLayers );
