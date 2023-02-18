// Event Create 
counter = 0;

enum cannonStates {
    idle,
    shoot
}

state4 = cannonStates.idle;

// event step 

switch (state4) {
    case cannonStates.idle: scr_cannon_idle(); break;
    case cannonStates.shoot: scr_cannon_shoot(); break;
}

// -------------function ------------

// scr_cannon_idle() 
sprite_index = spr_cannonIdle;
image_speed = 1/3;

// scr_cannon_shoot() 
sprite_index = spr_cannonShoot;
image_speed = 1/3;



if (image_index > image_number - 1) {
    instance_create(160, 64, obj_ball);
    state4 = cannonStates.idle;
}