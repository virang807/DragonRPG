acceptKey = keyboard_check_pressed(vk_space);


// Position of Camera and Text book
textBoxX = camera_get_view_x( view_camera[0] );
textBoxY = camera_get_view_y( view_camera[0] ) + 144;

// Setup
if(!setup)
{
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	// Loop through the pages
	pageNumber = array_length(text);
	for(var p = 0; p < pageNumber; p++)
	{
		// Find how many characters are on each page and stor enumber in textLength array
		textLength[p] = string_length(text[p]);
		
		// Get X position for textbook
		// No characters (center the textbox) 
		textXOffset[p] = 44; 
	}
	
}

// Typing the Text
if(drawChar < textLength[page])
{
	drawChar += textSpeed;
	drawChar = clamp(drawChar, 0, textLength[page]);
}

// Flip through pages
if(acceptKey)
{
	// If typing is done
	if(drawChar == textLength[page])
	{
		// Next Page
		if(page < pageNumber -1)
		{
			page++;
			drawChar = 0;
		}
		// Destroy Text Box
		else
		{
			instance_destroy();
		}
	}
	// Not Done Typing
	else
	{
		drawChar = textLength[page];
	}

}


// Draw the textbox
txtbImg += txtbImgSpeed;
txtbSprWidth = sprite_get_width(txtbSpr);
txtbSprHeight = sprite_get_height(txtbSpr);

// Draw back of the textbox
draw_sprite_ext(txtbSpr, txtbImg, textBoxX + textXOffset[page], textBoxY, textbookWidth/txtbSprWidth, textboxHeight/txtbSprHeight, 0, c_white, 1  );


// Draw the text
var _drawtext = string_copy(text[page], 1, drawChar);
draw_text_ext(textBoxX + textXOffset[page] + border, textBoxY + border, _drawtext, lineSep, lineWidth);




