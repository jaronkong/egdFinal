///quotaActive( index )

var aIndex = argument0;

with ( mainController ) {
    if ( aIndex < 0 ) return false;
    return quota[# aIndex, Quota.enabled];
}

return false;
