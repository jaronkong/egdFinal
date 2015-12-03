///quotaDestroy( index )

var aIndex = argument0;

with ( mainController ) {
    if ( aIndex < 0 ) exit;
    
    quota[# aIndex, Quota.enabled] = false;
    
    var tItemID = quota[# aIndex, Quota.itemID];
    repeat ( quota[# aIndex, Quota.produced] ) {
        quotaProduce( quota[# aIndex, Quota.itemID] );
    }
}
