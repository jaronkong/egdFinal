///gridItemAtPoint( x, y )
//Same as instance at point, but returns noone if a block

if ( !gridValidPoint( argument0, argument1 ) ) return noone;

return ds_grid_get( gridManager.gridItem,
    gridFromRoomX( argument0 ), gridFromRoomY( argument1 )
);