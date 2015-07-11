///HANDLE MOVEMENT

right = keyboard_check(argument0);
left = keyboard_check(argument1);
up = keyboard_check(argument2);
max_gravity = 15;

idle_sprite = argument3;
move_sprite = argument4;
jump_sprite = argument5;

if (right) {
        _hspeed = move_speed;
        image_xscale = 1;
}

if (left) {
        _hspeed = -move_speed;
        image_xscale = -1;
}

if (left and right) {
    _hspeed = 0;
}

if (not left and not right and on_ground)
    _hspeed -= sign(_hspeed) * _friction;

if (_vspeed < max_gravity) _vspeed += _gravity;

// always check thisbefore anything else
if (place_meeting(x, y+1, yellow_guy) )
{
    on_ground = true;
    _vspeed = up * -jump_speed;
} else {
    on_ground = false;
}

// handle horizontal
if (place_meeting(x + _hspeed, y , obg_barrier) ) {
    while not place_meeting(x + sign(_hspeed),y, obg_barrier) {
        x += sign(_hspeed)
    }
    _hspeed = 0;
    
}
x += _hspeed;

//handle vertical
if place_meeting(x, y+_vspeed , obg_barrier ) {
    while (not place_meeting(x,y + sign(_vspeed),obg_barrier) ){
    y += sign(_vspeed)
    }
    _vspeed = 0
}
y += _vspeed

// die if fall outside roo 

// if (y > room_height) instance_destroy()

// when jump right

    
    // not moving
    
    if(not left and not right) {
        if (on_ground) {
            sprite_index = idle_sprite;
        } else {
            sprite_index = jump_sprite;
        }
    }

