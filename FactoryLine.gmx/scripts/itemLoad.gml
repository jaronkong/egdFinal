///itemLoad( tag )
//Load in an item's data and assign it an id

var aTag = argument0;

if ( itemExists( aTag ) ) {
    return itemFromTag( aTag );
}

ini_open( working_directory + "/recipes/items.dat" );
var tName = ini_read_string( aTag, "name", aTag );
var tSprite = asset_get_index( ini_read_string( aTag, "sprite", "" ) );
var tBack = asset_get_index( ini_read_string( aTag, "b-sprite", "" ) );
var tScale = ini_read_real( aTag, "scale", 1 );
var tSpeed = ini_read_real( aTag, "speed", 0 );
var tColor = ini_read_real( aTag, "color", false );
var tIndex = itemDefine( aTag, tName, tSprite, tBack, tScale, tSpeed, tColor );
ini_close( );

return tIndex;
