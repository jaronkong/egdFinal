///deskSnapDocumentTo( id );
//forces a document to the desk

var aDoc = argument0;
var tDeskX, tDeskY, tDeskWidth, tDeskHeight;

with ( deskController ) {
    tDeskX = x;
    tDeskY = y;
    tDeskWidth = width;
    tDeskHeight = height;
}

with ( aDoc ) {
    if ( !fullscale ) {
    
        var tSmallHalfWidth = width * perspectiveSmallScale / 2;
        var tSmallHalfHeight = height * perspectiveSmallScale / 2;
        
        if ( x - tSmallHalfWidth < tDeskX ) {
            targetX = tDeskX + tSmallHalfWidth;
        }
        else if ( x + tSmallHalfWidth > tDeskX + tDeskWidth ) {
            targetX = tDeskX + tDeskWidth - tSmallHalfWidth;
        }
        
        if ( y - tSmallHalfHeight < tDeskY ) {
            targetY = tDeskY + tSmallHalfHeight;
        }
        else if ( y + tSmallHalfHeight > tDeskY + tDeskHeight ) {
            targetY = tDeskY +tDeskHeight - tSmallHalfHeight
        }
    
    }
    
}

