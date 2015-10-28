///itemLoad( tag )
//Load in an item's data and assign it an id

var aTag = argument0;

var tIndex = -1;

ini_open( working_directory + "/recipes/items.dat" );
if ( ini_section_exists( aTag ) || true ) {
    var tName = ini_read_string( aTag, "name", aTag );
    var tSprite = asset_get_index( ini_read_string( aTag, "sprite", "" ) );
    tIndex = itemDefine( aTag, tName, tSprite );
}
ini_close( );

return tIndex;
