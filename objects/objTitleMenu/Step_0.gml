// Get Inputs
up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_pressed(vk_enter);

// Store number of options Menu
opLength = array_length(options[menuLevel])

// Move through the memu
pos += down_key - up_key;

pos = (pos + opLength) % opLength;

// Using the Options
if(accept_key)
{
	var startMenuLevel = menuLevel;
	switch(menuLevel)
	{
		// Pause Menu
		case 0:
			switch(pos)
			{
				// Start Game
				case 0:
					room_goto(player_house);
					break;
				// Settings
				case 1: 
					menuLevel = 1;
					break;
				// Quit Game
				case 2:
					game_end();
					break;
			}
			break;
		
		// Settings
		case 1:
			switch(pos)
			{
				// Dialogue
				case 0:
					room_goto(rmTestDialogue);
					break;
					
				// Brightness
				case 1:
					break;
					
				// Controls
				case 2:
					break;
					
				// Back
				case 3:
					menuLevel = 0;
					break;
				
			}
			break;
	}
	
	// Set Position Back
	if(startMenuLevel != menuLevel)
	{
		pos = 0;
	}
	
	// Correct the Options Length
	opLength = array_length(options[menuLevel])

}






