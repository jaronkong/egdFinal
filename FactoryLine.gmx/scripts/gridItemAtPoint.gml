///gridItemAtPoint( x, y )
//Same as instance at point, but returns noone if a block

var tInst = gridInstanceAtPoint( argument0, argument1 );

if ( !isObject( tInst, item ) ) return noone;

return tInst;
