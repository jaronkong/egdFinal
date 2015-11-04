///itemLoad( tag )
//Load in an item's data and assign it an id

var aTag = argument0;

if ( itemExists( aTag ) ) {
    return itemFromTag( aTag );
}

ini_open( working_directory + "/recipes/items.dat" );
var tName = ini_read_string( aTag, "name", aTag );
var tSprite = asset_get_index( ini_read_string( aTag, "sprite", "" ) );
var tIndex = itemDefine( aTag, tName, tSprite );
ini_close( );

return tIndex;
