///deskIsOn( document id );
//If a document is on the desk, document must be small

var aDoc = argument0;

var tDeskX, tDeskY, tDeskWidth, tDeskHeight;

with ( deskController ) {
    tDeskX = x;
    tDeskY = y;
    tDeskWidth = width;
    tDeskHeight = height;
}

with ( aDoc ) {

    var tSmallHalfWidth = width * perspectiveTiltScale / 2;
    var tSmallHalfHeight = height * perspectiveTiltScale / 2;
    
    if ( x - tSmallHalfWidth > tDeskX && x + tSmallHalfWidth < tDeskX + tDeskWidth
        && y - tSmallHalfHeight > tDeskY && y + tSmallHalfHeight < tDeskY + tDeskHeight ) {
        
        return true;   
    }
    
}

return false;

