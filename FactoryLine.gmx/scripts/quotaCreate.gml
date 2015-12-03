///quotaCreate( itemID, required )

var aItem = itemFromTag( argument0 );
var aRequired = argument1;

with ( mainController ) {
    var tIndex = -1;
    for ( var i = 0; i < ds_grid_width( quota ); ++i ) {
        if ( quotaActive( i ) ) continue;
        if ( ds_list_find_index( quotaOrder, i ) < 0 ) {
            tIndex = i;
            break;
        }
    }
    if ( tIndex < 0 ) {
        tIndex = ds_grid_width( quota );
        ds_grid_resize( quota, ( tIndex + 1 ), Quota.count );
    }
    
    quota[# tIndex, Quota.enabled] = true;
    quota[# tIndex, Quota.itemID] = aItem;
    quota[# tIndex, Quota.required] = aRequired;
    quota[# tIndex, Quota.produced] = 0;
    quota[# tIndex, Quota.positionX] = 0;
    quota[# tIndex, Quota.positionY] = 10;
    
    ds_list_add( quotaOrder, tIndex );
    
    return tIndex;
}

return -1;
