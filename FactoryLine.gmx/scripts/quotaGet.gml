///quotaGet( itemID )
//Get a random quota assigned to item

var aItem = -1;
if ( argument_count > 0 ) {
    aItem = itemFromTag( argument[0] );
}

with ( mainController ) {
    var tCount = 0;
    var tValues = undefined;
    var tProbs = undefined;
    var tTotal = 0;
    for ( var i = 0; i < ds_grid_width( quota ); ++i ) {
        if ( !quotaActive( i ) ) continue;
        if ( ( quota[# i, Quota.itemID] == aItem ) || ( aItem < 0 ) ) {
            tValues[tCount] = i;
            tProbs[tCount] = 1;
            ++tCount;
            tTotal += 1;
        }
    }
    if ( tCount <= 0 ) return -1;
    return chooseWeight( tValues, tProbs, tTotal );
}

return -1;
