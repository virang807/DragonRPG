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

	for(var p = 0; p < pageNumber; p++)
	{
		// Find how many characters are on each page and stor enumber in textLength array
		textLength[p] = string_length(text[p]);
		
		// Get X position for textbook
		// No characters (center the textbox) 
		textXOffset[p] = 44; 
		
		// Setting indivdual characters and finding where lines of text should break
		for (var c = 0; c < textLength[p]; c++)
		{
			var _charPOS = c+1;
			
			// Store Characters into Char array from Scripts
			char[c, p] = string_char_at(text[p], _charPOS);
			
			// Get current width of the line
			var txtUpToChar = string_copy(text[p], 1, _charPOS);
			var currentTextWidth = string_width(txtUpToChar) - string_width(char[c,p]);
			
			// Get Last Free space
			if(char[c,p] == " ")
			{
				lastFreeSpace = _charPOS+1;
			}
			
			// Get Line Breaks
			if(currentTextWidth - lineBreakOffset[p] > lineWidth)
			{
				lineBreakPause[lineBreakNum[p]] = lastFreeSpace;
				lineBreakNum[p]++;
				var txtUpToLastSpace = string_copy(text[p], 1, lastFreeSpace);
				var lastFreeSpaceString = string_char_at(text[p], lastFreeSpace);
				lineBreakOffset[p] = string_width(txtUpToLastSpace) = string_width(lastFreeSpaceString);
			}
				
		}
		
			// Getting Each Characters Coordinates
		for(var c = 0; c < textLength[p]; c++)
		{
			var _charPOS = c+1;
			var txtX = textBoxX + textXOffset[p] + border;
			var txtY = textBoxY + border;
			
			// Get current width of the line
			var txtUpToChar = string_copy(text[p], 1, _charPOS);
			var currentTextWidth = string_width(txtUpToChar) - string_width(char[c,p]);
			var txtLine = 0;
			
			// Compensate for string breaks
			for(var lb = 0; lb < lineBreakNum[p]; lb++)
			{
				// If current looping chracter is after a line break
				if(_charPOS >= lineBreakPause[lb, p])
				{
					var strCopy = string_copy( text[p], lineBreakPause[lb, p], _charPOS - lineBreakPause[lb, p]);
					currentTextWidth = string_width(strCopy);
					
					// record line this chracter should be on
					txtLine = lb+1;
				}
			}
			
			// add to the x and y positions based on new infor
			charX[c, p] = txtX + currentTextWidth;
			charY[c,p] = txtY + txtLine*lineSep;
			
		
		}
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
			// Link text for Options
			if(optionNumber > 0)
			{
				createTextbook(optionLinkId[optionPosition]);
			}
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
var _txtBX = textBoxX + textXOffset[page];
var _txtBY = textBoxY;

txtbImg += txtbImgSpeed;
txtbSprWidth = sprite_get_width(txtbSpr);
txtbSprHeight = sprite_get_height(txtbSpr);

// Draw back of the textbox
draw_sprite_ext(txtbSpr, txtbImg, _txtBX, _txtBY, textbookWidth/txtbSprWidth, textboxHeight/txtbSprHeight, 0, c_white, 1  );


// Options
if(drawChar == textLength[page] && page == pageNumber-1)
{
	
	// Option Selection
	optionPosition += keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	optionPosition = clamp(optionPosition, 0, optionNumber-1);
	
	
	// Draw the Options
	var _opSpace = 15;
	var _opBorder = 4;
	for (var op = 0; op < optionNumber; op++)
	{
		// Draw Option Box
		var _oWidth = string_width(option[op]) + _opBorder*2;
		draw_sprite_ext(txtbSpr, txtbImg, _txtBX + 16, _txtBY - _opSpace*optionNumber + _opSpace*op - 1, _oWidth/txtbSprWidth, (_opSpace-1)/txtbSprHeight, 0, c_white, 1);
		
		// The Arrow
		if(optionPosition == op)
		{
			draw_sprite(sprTextBoxArrow, 0, _txtBX, _txtBY - _opSpace*optionNumber + _opSpace*op - 1);
		}
		
		// Option Text
		draw_text(_txtBX + 16 + _opBorder,  _txtBY - _opSpace*optionNumber + _opSpace*op -2, option[op])
	}
}

// Draw the text
//var _drawtext = string_copy(text[page], 1, drawChar);
//draw_text_ext(_txtBX + border, _txtBY + border, _drawtext, lineSep, lineWidth);
for(var c = 0; c < drawChar; c++)
{
	draw_text( charX[c, page], charY[c, page], char[c, page]) 
}




