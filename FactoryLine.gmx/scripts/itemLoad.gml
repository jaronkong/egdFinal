///itemLoad( tag )
//Load in an item's data and assign it an id

var aTag = argument0;

if ( itemExists( aTag ) ) {
    return itemFromTag( aTag );
}

ini_open( working_directory + "/recipes/items.dat" );
var tName = ini_read_string( aTag, "name", aTag );
var tSprite = asset_get_index( ini_read_string( aTag, "sprite", "" ) );
var tScale = ini_read_real( aTag, "scale", 1 );
var tColor = ini_read_real( aTag, "color", false );
var tIndex = itemDefine( aTag, tName, tSprite, tScale, tColor );
ini_close( );

return tIndex;
