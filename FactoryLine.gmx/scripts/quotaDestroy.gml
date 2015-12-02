///quotaDestroy( index )

var aIndex = argument0;

with ( mainController ) {
    if ( aIndex < 0 ) exit;
    var tItemID = quota[# aIndex, Quota.itemID];
    quota[# aIndex, Quota.itemID] = -1;
    if ( tItemID >= 0 ) {
        repeat ( quota[# aIndex, Quota.produced] ) {
            quotaProduce( tItemID );
        }
    }
}
