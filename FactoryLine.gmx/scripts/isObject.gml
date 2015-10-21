///isObject( obj, parent )
//Test if an object or instance inherits from another object
//Because object_is_ancestor returns false if both are the same
//Plus having to do inst.object_index is annoying

var tObj = argument0;
var tPar = argument1;

if ( instance_exists( tObj ) ) {
    tObj = tObj.object_index;
}

return ( ( tObj == tPar ) || object_is_ancestor( tObj, tPar ) );