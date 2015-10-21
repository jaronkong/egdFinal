///refraction_addToQueue( id );

if ( instance_exists( refractionController ) ) {
    ds_queue_enqueue( refractionController.drawQueue, argument0 );
}