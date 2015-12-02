///timeOver();
//Called when timer runs out

with ( mainController ) {
    levelTime = 10 * 60;
    level += 1;
    increaseRestrictionLevel( level );
    with ( restrictionPar ) {
        instance_destroy();
    }
}


