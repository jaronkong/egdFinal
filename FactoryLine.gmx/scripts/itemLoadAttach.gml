///itemLoadAttach( base, attachments, counts, count )

var aBase = argument0;
var aAttach = argument1;
var aAttachCount = argument2;
var aCount = argument3;

var tTag = itemProperty( aBase, Item.tag );
var tName = itemProperty( aBase, Item.name );
var tSprite = itemProperty( aBase, Item.sprite );

ini_open( working_directory + "/recipes/attachments.dat" );
for ( var i = 0; i < aCount; ++i ) {
    if ( aAttachCount[i] > 0 ) {
        tTag += "-" + string( aAttachCount[i] ) + itemProperty( aAttach[i], Item.tag );
        tName += "#" + string( aAttachCount[i] ) + " " + itemProperty( aAttach[i], Item.name );
    }
}
ini_close( )

return itemDefine( tTag, tName, tSprite );
