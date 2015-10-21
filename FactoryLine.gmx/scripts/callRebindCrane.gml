///callRebindCrane( targetX, targetY );

var aX = argument0;
var aY = argument1;
var tNewPoker = instance_create( aX, room_height, rebindPoker );

with ( tNewPoker ) {
    targetX = aX;
    targetY = aY;
}

