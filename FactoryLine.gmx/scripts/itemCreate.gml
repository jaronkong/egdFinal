///itemCreate( x, y, item )

var aItem = argument2;

//Convert tag to id
if ( is_string( aItem ) ) {
    aItem = itemFromTag( aItem );
}

//If invalid id, garbage
if ( aItem < 0 ) {
    aItem = itemFromTag( "garbage" );
}

//Spawn it at the position
var tInst = instance_create( argument0, argument1, item );
tInst.itemID = aItem;
return tInst;
