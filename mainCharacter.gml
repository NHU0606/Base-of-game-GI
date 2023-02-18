PS: 
init state at line:
moverment allow arrow key at line:
collision at line:


// -----------init state -----------------

// choose event Create 

enum kingStates { 
    idle,
    run,
    attack,
    jump
    // if u find another state for chracter u have, just fill it
}

state = kingStates.idle;

// and some var u need
spd = 3;
grav = 1;
moveX = 0;
moveY = 0;
counter = 0;
hp = 3;

// ------------check state to get value of function--------------

// choose event Step 

scr_getinput();

switch (state) {
    case (kingStates.idle):
        scr_king_idle();
        break;
    case (kingStates.attack):
        scr_king_attack();
        break;
    case (kingStates.run):
        scr_king_run();
        break;
    case (kingStates.jump):
        scr_king_jump();
        break;    
    // if u find another state for chracter u have, just fill it
}

//-------------write function -------------------

// scr_getinput(); 

pressLeft = keyboard_check(vk_left);
pressRight = keyboard_check(vk_right);
pressUp = keyboard_check_pressed(vk_up);
pressSpace = keyboard_check_pressed(vk_space);
pressS = keyboard_check_pressed(ord("S"));
pressR = keyboard_check_pressed(ord("R"));




// scr_king_idle(); 

scr_getinput();

sprite_index = spr_kingIdle;

if (pressSpace) {
    state = kingStates.attack;
} else if (pressLeft or pressRight) {
    state = kingStates.run;
} else if (pressUp) {
    moveY = -10;
    state = kingStates.jump;
} 

moveX = 0;




// scr_king_attack(); 

scr_getinput();

sprite_index = spr_kingAttack;
image_speed = 1;


//sou_attack is name of music when attack will appear

if(!audio_is_playing(sou_attack)) {
    audio_play_sound(sou_attack, 1, true);
}

counter += 1;
if counter == 6 {
    if (image_xscale > 0) {
        //instance_create is create object at coordinates xy u want
        // u can understand at underline is: at object coordinates x+15, y-10 of obj_king, create obj_dealDam for obj_king 
        instance_create(obj_king.x + 15, obj_king.y - 10, obj_dealDam);
    } else if (image_xscale < 0) {
        instance_create(obj_king.x - 45, obj_king.y - 10, obj_dealDam);
    }
    // this underline will stop sound had name sou_attack
    audio_stop_sound(sou_attack);
    counter = 0;
    state = kingStates.idle;
}


// scr_king_run(); 

scr_getinput();

sprite_index = spr_kingRun; 

if !audio_is_playing(sou_running) {
    audio_play_sound(sou_running, 1, true);
}

moveX = (pressRight - pressLeft) * spd;

if (pressLeft + pressRight == 0) {
    audio_stop_sound(sou_running);
    state = kingStates.idle;
}

if (pressUp) {
    moveX = 0;
    moveY = -10;
    audio_stop_sound(sou_running);
    state = kingStates.jump;
}

if (pressSpace) {
    audio_stop_sound(sou_running);
    state = kingStates.attack;
}


// scr_king_jump(); 

scr_getinput();

sprite_index = spr_kingJump;

// Idle when collision ground
if (place_meeting(x, y + moveY, o_ground))
{
    repeat(abs(moveY))
    {
        if (not place_meeting(x, y + sign(moveY), o_ground))
        {
            y += sign(moveY);
        }
        break;
    }
           
    state = kingStates.idle;
}

// Movement on the air
if (pressSpace) {
    state = kingStates.attack;
}

if (pressRight) {
    moveX = spd - 1;
    if (pressSpace) {
    state = kingStates.attack;
    }
} 

if (pressLeft) {
    moveX = -(spd -1);
    if (pressSpace) {
    state = kingStates.attack;
    }
}


// plus score or minus HP
// u have to another object to collision with main character

