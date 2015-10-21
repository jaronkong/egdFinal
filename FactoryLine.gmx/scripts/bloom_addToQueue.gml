///bloom_addToQueue( id, bloomPriority );

if ( instance_exists( bloomController ) ) {
    ds_priority_add( bloomController.drawQueue, argument0, argument1 );
}
