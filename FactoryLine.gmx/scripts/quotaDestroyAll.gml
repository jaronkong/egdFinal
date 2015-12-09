///quotaDestroyAll( )

with ( mainController ) {
    for ( var i = 0; i < ds_grid_width( quota ); ++i ) {
        quota[# i, Quota.enabled] = false;
        
        var tItemID = quota[# i, Quota.itemID];
        repeat ( quota[# i, Quota.produced] ) {
            quotaProduce( quota[# i, Quota.itemID] );
        }
    }
}
