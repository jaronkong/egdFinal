///itemLoad( tag )
//Load in an item's data and assign it an id

var aTag = argument0;

var tIndex = itemFromTag( aTag )
if ( tIndex >= 0 ) return tIndex;

var tName = ini_read_string( aTag, "name", aTag );
var tSprite = asset_get_index( ini_read_string( aTag, "sprite", "" ) );

return itemDefine( aTag, tName, tSprite );