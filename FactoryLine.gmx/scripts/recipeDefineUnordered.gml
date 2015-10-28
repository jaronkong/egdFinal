///recipeDefineUnordered( result, method, item0, ..., itemN )
//The same as recipeDefine, but adds a recipe for every item order

var aResult = argument[0];
var aMethod = argument[1];
var aItem = false;
var aCount = 0;
for ( var i = 2; i < argument_count; ++i ) {
    var aInput = argument[i];
    if ( is_string( aInput ) ) {
        aItem[aCount++] = aInput;
    } else if ( is_array( aInput ) ) {
        for ( var j = 0; j < array_length_1d( aInput ); ++j ) {
            aItem[aCount++] = aInput[j];
        }
    }
}

var tQueue = ds_queue_create( );
ds_queue_enqueue( tQueue, false, aItem );
while ( !ds_queue_empty( tQueue ) ) {
    var tArrayBase = ds_queue_dequeue( tQueue );
    var tArrayNext = ds_queue_dequeue( tQueue );
    
    for ( var i = 0; i < array_length_1d( tArrayNext ); ++i ) {
        var tNewBase = false;
        var tNewBaseCount = 0;
        if ( is_array( tArrayBase ) ) {
            for ( var j = 0; j < array_length_1d( tArrayBase ); ++j ) {
                tNewBase[tNewBaseCount++] = tArrayBase[j];
            }
        }
        
        var tNewNext = false;
        var tNewNextCount = 0;
        if ( is_array( tArrayNext ) ) {
            for ( var j = 0; j < array_length_1d( tArrayNext ); ++j ) {
                if ( j != i ) {
                    tNewNext[tNewNextCount++] = tArrayNext[j];
                }
            }
        }
        
        tNewBase[tNewBaseCount++] = tArrayNext[i];
        
        if ( tNewNextCount > 0 ) {
            ds_queue_enqueue( tQueue, tNewBase, tNewNext );
        } else {
            recipeDefine( aResult, aMethod, tNewBase );
        }
    }
}
ds_queue_destroy( tQueue );
