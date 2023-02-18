// make effect with type Explosion, color is white
effect_create_above(ef_explosion, x, y, 0, c_white);

// destroy 1 object
instance_destroy();

// start music 
audio_play_sound(name sound, 1, false) // falese is have loop or not ->not

// check music is playing or not
if (!audio_is_playing(name music)) {
    
}
