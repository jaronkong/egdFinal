///deskIsOn( document id );
//If a document is on the desk

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
        //Only small docs need to be on the desk
        var tSmallHalfWidth = width * perspectiveTiltScale / 2;
        var tSmallHalfHeight = height * perspectiveTiltScale / 2;
        
    }
}

