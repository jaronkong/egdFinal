///fluid_attachParticleSystem( system );

if ( !instance_exists( fluidController ) ) {
    exit;
}
part_system_automatic_draw( argument0, false );
with ( instance_create( 0, 0, fluidParticleDrawer ) ) {
    targetSystem = argument0;
}