///isPlaceableLocation( x, y, block );

var aX = gridFromRoomX( argument0 );
var aY = gridFromRoomY( argument1 );
var aBlock = argument2;

if ( instance_exists( aBlock ) ) {
    with ( aBlock ) {
        for ( var i = 0; i < cellCount; ++i ) {
            var cx = ( aX + cellPosX[i] );
            var cy = ( aY + cellPosY[i] );
            if ( !gridValidCell( cx, cy ) ) continue;
            if ( gridBlockAtPoint( gridToRoomX( cx ), gridToRoomY( cy ) ) ) {
                return false;
            }
        }
    }
} 

return true;

