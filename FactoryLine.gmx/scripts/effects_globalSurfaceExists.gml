///effects_globalSurfaceExists();

if ( !surface_exists( global.shaderEffectSurface ) ) {
    effects_surfaceInit();
}