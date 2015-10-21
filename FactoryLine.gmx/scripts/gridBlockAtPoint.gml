///gridBlockAtPoint( x, y )
//Same as instance at point, but returns noone if an item

if ( !gridValidPoint( argument0, argument1 ) ) return noone;

return ds_grid_get( gridManager.gridBlock,
    gridFromRoomX( argument0 ), gridFromRoomY( argument1 )
);
