///gridValidPoint( x, y )
//Check if a position is within the grid

with ( gridManager ) {
    return point_in_rectangle(
        argument0, argument1, 0, 0,
        ( ds_grid_width( grid ) * width ),
        ( ds_grid_height( grid ) * height )
    );
}
