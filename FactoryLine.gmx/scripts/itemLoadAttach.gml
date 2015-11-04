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
    ini_open( working_directory + "/recipes/attachments.dat" );
    var tLayerData = false;
    if ( !ini_read_real( aAttach[i], "manual", false ) ) {
        for ( var j = 0; j < aAttachCount[i]; ++j ) {
            tLayerData[j] = string( j );
        }
    } else {
        var tString = ini_read_string( aAttach[i], string( aAttachCount[i] ), "" );
        while ( string_count( ",", tString ) > 0 ) {
            var tIndex = string_pos( ",", tString );
            tLayerData[array_length_1d(tLayerData)] = string_copy( tString, 1, tIndex-1 );
            tString = string_delete( tString, 1, tIndex );
        }
        if ( tString != "" ) tLayerData[array_length_1d(tLayerData)] = tString;
    }
    ini_close( );
    for ( var j = 0; j < array_length_1d( tLayerData ); ++j ) {
        var tLayerTag = ( aAttach[i] + "-" + string( tLayerData[j] ) );
        tLayers[array_length_1d(tLayers)] = itemLayerLoad( tLayerTag );
    }
}

return itemDefine( tTag, tName, tSprite, tLayers );
