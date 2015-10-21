///fluidObstacle_addToQueue( id );

if ( instance_exists( fluidController ) ) {
    ds_queue_enqueue( fluidController.obstacleQueue, argument0 );
}
