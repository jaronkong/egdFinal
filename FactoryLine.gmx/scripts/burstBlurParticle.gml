///burstBlurParticle( partType, xMin, xMax, yMin, yMax, shape, distr, amount );

var aPartType = argument0;
var aXMin = argument1;
var aXMax = argument2;
var aYMin = argument3;
var aYMax = argument4;
var aShape = argument5;
var aDistr = argument6;
var aAmount = argument7;

if ( !instance_exists( blurParticleController ) ) {
    instance_create( 0, 0, blurParticleController );
}

with ( blurParticleController ) {
    part_emitter_region( blurSystem, emitter1, aXMin, aXMax, aYMin, aYMax, aShape, aDistr );
    part_emitter_burst( blurSystem, emitter1, aPartType, aAmount );
}