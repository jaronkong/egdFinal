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

pSparkBurst = part_type_create();
part_type_sprite(pSparkBurst, particle_line_spr, 1, 1, 0 );
part_type_size(pSparkBurst,0.1,0.3,0.005,0.05);
part_type_scale(pSparkBurst,1,0.5);
part_type_color3(pSparkBurst,c_blue, c_orange, c_red);
part_type_alpha2(pSparkBurst,1,0);
part_type_speed(pSparkBurst,1,15,-0.03,0);
part_type_direction(pSparkBurst,0,360,0,1);
part_type_orientation(pSparkBurst,0,0,0,0,1);
part_type_blend(pSparkBurst,1);
part_type_life(pSparkBurst,10,45);
part_type_gravity(pSparkBurst, 0.25, 270);
ds_map_add( global.particleMap, "sparkBurst", pSparkBurst );

