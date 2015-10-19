///itemCreate( x, y, item )

var aItem = argument2;
if ( is_string( aItem ) ) {
    aItem = itemFromTag( aItem );
}

var tInst = instance_create( argument0, argument1, item );
tInst.itemID = aItem;
return tInst;
