// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dialogue() constructor{
	
	_dialogs = [];
	
	add = function(_sprite, _message) {
		array_push(_dialogs, {
			sprite: _sprite,
			message: _message,
		});
	}
	
	pop = function() {
		var _firstElement = array_first(_dialogs);
		array_delete(_dialogs, 0, 1);
		
		return _firstElement;
	}
	
	count = function(){
		return array_length(_dialogs);
	}

}