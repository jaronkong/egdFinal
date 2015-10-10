///gridBlockAtPoint( x, y )
//Same as instance at point, but returns noone if an item

var tInst = gridInstanceAtPoint( argument0, argument1 );

if ( !isObject( tInst, block ) ) return noone;

return tInst;
