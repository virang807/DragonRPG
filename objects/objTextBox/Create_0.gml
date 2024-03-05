depth = -999;


// Textbox parameters
textbookWidth  = 200;
textboxHeight = 64;
border = 8;
lineSep = 12;
lineWidth = textbookWidth - border*2;

txtbSpr = sprMenuBG;
txtbImg = 0;
txtbImgSpeed = 6/60;

// Text
page = 0;
pageNumber = 0;
text[0] = "";
textLength[0] = string_length(text[0]);

char[0,0] = " ";
charX[0,0] = 0;
charY[0,0] = 0;

drawChar = 0;
textSpeed = 1;

// Options
option[0] = "";
optionLinkId[0] = -1;
optionPosition = 0;
optionNumber = 0;

setup = false;

// Effects
scrSetDefaultForText();
lastFreeSpace = 0;






