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

    var tSmallHalfWidth = width * perspectiveSmallScale / 2;
    var tSmallHalfHeight = height * perspectiveSmallScale / 2;
    
    if ( x - tSmallHalfWidth > tDeskX && x + tSmallHalfWidth < tDeskX + tDeskWidth
        && y - tSmallHalfHeight > tDeskY && y + tSmallHalfHeight < tDeskY + tDeskHeight ) {
        
        return true;   
    }
    
    if ( dragging
        && mouse_x > tDeskX && mouse_x < tDeskX + tDeskWidth
        && mouse_y > tDeskY && mouse_y < tDeskY + tDeskHeight ) {
     
        return true;   
    }
    
}

return false;

