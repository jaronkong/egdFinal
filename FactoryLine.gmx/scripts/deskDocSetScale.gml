///deskDocSetScale( id doc, bool fullscale? );

with ( argument0 ) {
    if ( argument1 ) {
        targetXScale = 1;
        targetYScale = 1;
        perspectiveTiltScale_target = 0;
        smallSpriteAlpha_target = 0;
        if ( y - height/2 < deskController.y ) {
            targetY = deskController.y - height/2 - 32;
        }
    }
    else {
        targetXScale = perspectiveSmallScale;
        targetYScale = perspectiveSmallScale;
        perspectiveTiltScale_target = perspectiveTiltScale;
        smallSpriteAlpha_target = 1;
    }
}
