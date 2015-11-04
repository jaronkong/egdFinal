///verticalTrayCreate( x, y, trayContents, numContents );

var aX = argument0;
var aY = argument1;
var aTrayContents = argument2;
var aNumContents = argument3;

var tNewTray = instance_create( aX, aY, verticalTray );

with ( tNewTray ) {
    trayContents = aTrayContents;
    numSections = aNumContents;
    maxSlideOffset = headHeight + numSections*trayHeight;
}

return tNewTray;

