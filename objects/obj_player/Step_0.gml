// Step Event runs every frame of the game, like moving the player
right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));

xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd; // Up in movement means y value goes down

// Set the Sprite
mask_index = sprite[DOWN];

if(yspd == 0)
{
	if(xspd > 0)
	{
		face = RIGHT;
	}
	else if (xspd < 0)
	{
		face = LEFT;
	}
	
	// Moving to right means positive speed
	if(xspd > 0 && face == LEFT)
	{
		face = RIGHT;
	}
	if(xspd < 0 && face == RIGHT)
	{
		face = LEFT;
	}
}

if(xspd == 0)
{
	if(yspd > 0)
	{
		face = DOWN;
	}
	else if(yspd < 0)
	{
		face = UP;
	}
	// Positive y is moving down
	if(yspd > 0 && face == UP)
	{
		face = DOWN;
	}
	if(yspd < 0 && face == DOWN)
	{
		face = UP;
	}
}

sprite_index = sprite[face];

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


// Animate
if(xspd == 0 && yspd == 0)
{
	image_index = 0;
}

// Depth
depth = -bbox_bottom;

