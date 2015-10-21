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
part_type_life(pSmokeBurst,15,30);
ds_map_add( global.particleMap, "smokeBurst", pSmokeBurst );

pSmokeUpshot = part_type_create();
part_type_sprite(pSmokeUpshot, particle_fire_spr, 1, 1, 0 );
part_type_size(pSmokeUpshot,0.4,1,0.005,0.05);
part_type_scale(pSmokeUpshot,1,1);
part_type_color1(pSmokeUpshot,c_white);
part_type_alpha2(pSmokeUpshot,1,0);
part_type_speed(pSmokeUpshot,1,15,-0.03,0);
part_type_direction(pSmokeUpshot,90 - 30,90 + 30,0,1);
part_type_orientation(pSmokeUpshot,0,360,0,0,0);
part_type_blend(pSmokeUpshot,1);
part_type_life(pSmokeUpshot,10,20);
ds_map_add( global.particleMap, "smokeUpshot", pSmokeUpshot );
