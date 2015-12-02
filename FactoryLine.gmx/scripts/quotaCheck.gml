///quotaCheck( [itemID] )
//Check that the quotas are done

var aItem = -1;
if ( argument_count >= 1 ) {
    aItem = itemFromTag( argument[0] );
}

with ( mainController ) {
    for ( var i = 0; i < ds_grid_width( quota ); ++i ) {
        if ( !quotaActive( i ) ) continue;
        if ( ( aItem == quota[# i, Quota.itemID] ) || ( aItem < 0 ) ) {
            if ( quota[# i, Quota.produced] < quota[# i, Quota.required] ) {
                return false;
            }
        }
    }
}

return true;
