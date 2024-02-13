// param @text_id
function scrGameText(_textId)
{
	switch(_textId)
	{
		case "npc1":
			scrText("Hello I am the first NPC");
			scrText("I hate you already");
				scrOption("Damn, son", "npc1 - positive");
				scrOption("I hate you as well!", "npc1 - negative");
			break;
			
			case "npc1 - positive":
				scrText("AHHHHHHHHHHHHHHHH");
				break;
			case "npc1 - negative":
				scrText("Lmao, you a real one for real for real");
				break;
			
		case "npc2":
			scrText("Dont Worry about him!");
			scrText("That guy is a real jerk");
			break;
		case "npc3":
			scrText("I am dumb");
			scrText("Uninstall this game now! FOR YOUR OWN GOOD");
			break;
		
	}
}