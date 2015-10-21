///itemProperty( itemID, index )

var aItem = argument0;

//Convert tag to id
if ( is_string( aItem ) ) {
    aItem = itemFromTag( aItem );
}

//If invalid id, garbage
if ( aItem < 0 ) {
    aItem = itemFromTag( "garbage" );
}

//Get the value
with ( itemManager ) {
    return ds_grid_get( items, aItem, argument1 );
}

//Give up
return undefined;