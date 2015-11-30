///quotaDestroy( index )

var aIndex = argument0;

with ( mainController ) {
    quota[# aIndex, Quota.itemID] = -1;
}
