///gridValidCell( x, y )
//Check if a grid cell is within range

with ( gridManager ) {
    if ( ( argument0 >= 0 ) && ( argument0 < gridWidth ) ) {
        if ( ( argument1 >= 0 ) && ( argument1 < gridHeight ) ) {
            return true;
        }
    }
}

return false;
