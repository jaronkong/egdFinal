///refracton_attachParticleSystem( system );

if ( !instance_exists( refractionController ) ) {
    exit;
}

part_system_automatic_draw( argument0, false );
with ( instance_create( 0, 0, refractionParticleDrawer ) ) {
    targetSystem = argument0;
}

