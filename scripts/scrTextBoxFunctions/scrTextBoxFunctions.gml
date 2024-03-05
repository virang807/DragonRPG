function scrSetDefaultForText(){
	lineBreakPause[0, pageNumber] = 999;
	lineBreakNum[pageNumber] = 0;
	lineBreakOffset[pageNumber] = 0;
}



// @param text
function scrText(_text){
	
	scrSetDefaultForText();
	
	text[pageNumber] = _text;
	pageNumber++;

}

// @param option
// @param linkId
function scrOption(_option, _linkId)
{
	option[optionNumber] = _option;
	optionLinkId[optionNumber] = _linkId;
	optionNumber++;
}


// param text_id
function createTextbook(_textId)
{
	with (instance_create_depth(0,0, -999, objTextBox))
	{
		scrGameText(_textId);
	}
}