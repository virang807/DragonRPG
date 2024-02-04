// Step Event runs every frame of the game, like moving the player
right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));

xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd; // Up in movement means y value goes down

//  Code for Collision for Wall
if (place_meeting(x + xspd, y, obj_wall))
{
	xspd = 0;
}

if (place_meeting(x, y + yspd, obj_wall))
{
	yspd = 0;
}



x+=xspd; //Build in variable for the object
y+=yspd;

// end
