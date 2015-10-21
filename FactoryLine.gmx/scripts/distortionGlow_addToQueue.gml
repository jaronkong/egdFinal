///distortionGlow_addToQueue( id );

if ( instance_exists( distortionGlowController ) ) {
    ds_queue_enqueue( distortionGlowController.drawQueue, argument0 );
}
