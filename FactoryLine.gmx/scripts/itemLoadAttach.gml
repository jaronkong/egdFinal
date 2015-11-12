///itemLoadAttach( base, attachments, counts )

var aBase = argument0;
var aAttach = argument1;
var aAttachCount = argument2;
var aCount = array_length_1d( aAttachCount );

var tTag = itemProperty( aBase, Item.tag );
var tName = itemProperty( aBase, Item.name );
var tSprite = itemProperty( aBase, Item.sprite );
var tScale = itemProperty( aBase, Item.scale );
var tColor = itemProperty( aBase, Item.color );

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
ini_open( working_directory + "/recipes/attachments.dat" );
var tLayersF = undefined;
var tLayersB = undefined;
for ( var i = 0; i < aCount; ++i ) {
    var tLayerData = false;
    if ( !ini_read_real( aAttach[i], "manual", false ) ) {
        for ( var j = 0; j < aAttachCount[i]; ++j ) {
            tLayerData[j] = string( j );
        }
    } else {
        var tString = ini_read_string( aAttach[i], string( aAttachCount[i] ), "" );
        while ( string_count( ",", tString ) > 0 ) {
            var tIndex = string_pos( ",", tString );
            var tLayerIndex = array_length_1d( tLayerData );
            tLayerData[tLayerIndex] = string_copy( tString, 1, tIndex-1 );
            tString = string_delete( tString, 1, tIndex );
        }
        if ( tString != "" ) tLayerData[array_length_1d(tLayerData)] = tString;
    }
    //Load the layers
    for ( var k = 0; k < array_length_1d( tLayerData ); ++k ) {
        var tLayerIndex = itemLayerLoad( aAttach[i], tLayerData[k], "b" );
        if ( tLayerIndex >= 0 ) {
            tLayersB[array_length_1d(tLayersB)] = tLayerIndex;
        }
    }
    for ( var j = 0; j < 2; ++j ) {
        var tPrefix = "";
        if ( j == 1 ) tPrefix = "f";
        for ( var k = 0; k < array_length_1d( tLayerData ); ++k ) {
            var tLayerIndex = itemLayerLoad( aAttach[i], tLayerData[k], tPrefix );
            if ( tLayerIndex >= 0 ) {
                tLayersF[array_length_1d(tLayersF)] = tLayerIndex;
            }
        }
    }
}
ini_close( );

return itemDefine( tTag, tName, tSprite, tScale, tColor, tLayersF, tLayersB );
