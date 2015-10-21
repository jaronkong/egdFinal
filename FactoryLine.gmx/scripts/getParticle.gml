///getParticle( inputName );

var aInputName = argument0;

var tRet = ds_map_find_value( global.particleMap, aInputName );
//if ( tRet > 0 ) {

    return tRet;
//} 
//else {
//    show_debug_message( "ERROR: Could not find " + aInputName + " in particle map" );
//    return -1;
//}
/*
if ( ds_map_exists( global.particleMap, aInputName ) ) {

    return ds_map_find_value( global.particleMap, aInputName );
} 
else {
    show_debug_message( "ERROR: Could not find " + aInputName + " in particle map" );
    return -1;
}
*/