///particleInit_general();
//Little misc effects

if ( ds_map_exists( global.particleMap, "smokeBurst" ) ) {
    exit;
}

pSmokeBurst = part_type_create();
part_type_sprite(pSmokeBurst, particle_fire_spr, 1, 1, 0 );
part_type_size(pSmokeBurst,0.4,1,0.005,0.05);
part_type_scale(pSmokeBurst,1,1);
part_type_color3(pSmokeBurst,c_white, c_dkgray, c_gray);
part_type_alpha3(pSmokeBurst,0.2, 0.5,0);
part_type_speed(pSmokeBurst,1,6,-0.03,0);
part_type_direction(pSmokeBurst,0,359,0,1);
part_type_orientation(pSmokeBurst,0,360,0,0,0);
part_type_blend(pSmokeBurst,1);
part_type_life(pSmokeBurst,30,60);
ds_map_add( global.particleMap, "smokeBurst", pSmokeBurst );
