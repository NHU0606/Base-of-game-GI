// event create
counter = 0;
hp = 5;

enum boxStates {
    idle,
    hit
}

state2 = boxStates.idle;

//event step
if state2 == boxStates.idle {
    scr_box_idle();
} else if state2 == boxStates.hit {
    scr_box_hit();
}

//-----------funcrion--------------

// scr_box_idle()
sprite_index = spr_boxIdle;

if (place_meeting(x, y, obj_dealDam)) {
    state2 = boxStates.hit;
    with (obj_dealDam) instance_destroy();
}

// scr_box_hit() 

sprite_index = spr_boxHit;

if !audio_is_playing(sou_hitBox) {
    audio_play_sound(sou_hitBox, 1, false);
}

counter ++;

if counter == 4 {
    hp --;
    state2 = boxStates.idle;
    counter = 0;
}

if hp <= 0 {
    effect_create_above(ef_explosion, x, y, 0, c_white);
    instance_destroy();
    audio_play_sound(sou_explosion, 1, false);
}