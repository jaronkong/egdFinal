///gridInstanceAtPoint( x, y )
//Get the instance in the cell at room position x, y

if ( !gridValidPoint( argument0, argument1 ) ) return noone;

return ds_grid_get( gridManager.grid,
    gridFromRoomX( argument0 ), gridFromRoomY( argument1 )
);
