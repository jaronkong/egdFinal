///quotaDestroy( index )

var aIndex = argument0;

with ( mainController ) {
    if ( aIndex < 0 ) exit;
    
    var tOrder = ds_list_find_index( quotaOrder, aIndex );
    if ( tOrder >= 0 ) {
        ds_list_delete( quotaOrder, tOrder );
    }
    
    var tItemID = quota[# aIndex, Quota.itemID];
    quota[# aIndex, Quota.itemID] = -1;
    
    if ( tItemID >= 0 ) {
        repeat ( quota[# aIndex, Quota.produced] ) {
            quotaProduce( tItemID );
        }
    }
}
