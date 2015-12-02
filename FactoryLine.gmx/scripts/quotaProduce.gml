///quotaProduce( itemID )

var aItem = itemFromTag( argument0 );

with ( mainController ) {
    for ( var i = 0; i < ds_grid_width( quota ); ++i ) {
        if ( !quotaActive( i ) ) continue;
        if ( quota[# i, Quota.itemID] != aItem ) continue;
        if ( quota[# i, Quota.produced] < quota[# i, Quota.required] ) {
            quota[# i, Quota.produced] += 1;
            break;
        }
    }
}
