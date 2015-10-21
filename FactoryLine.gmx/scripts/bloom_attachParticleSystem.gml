///bloom_attachParticleSystem( system, bloomDepth );

if ( !instance_exists( bloomController ) ) {
    exit;
}
part_system_automatic_draw( argument0, false );
with ( instance_create( 0, 0, bloomParticleDrawer ) ) {
    targetSystem = argument0;
    bloomDepth = argument1;

}

