///gridValidCell( x, y )
//Check if a grid cell is within range

with ( gridManager ) {
    return point_in_rectangle( argument0, argument1,
        0, 0, gridWidth, gridHeight
    );
}