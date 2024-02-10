draw_set_font(global.font_main);

// Dynamically get width and height of Menu
var _newWidth = 1;
for(var i = 0; i < opLength; i++)
{
	var _opWidth = string_width(options[menuLevel, i]);
	_newWidth = max(_newWidth, _opWidth);
}
width = _newWidth + opBorder*2;
height = opBorder*2 + string_height(options[0,0]) + (opLength -1)*opSpace;

// Center Menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

//Draw Menu BG
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);


//Draw Options

draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < opLength; i++)
{
	var _c = c_white;
	if(pos == i)
	{
		_c = c_blue;
	}
	draw_text_color(x + opBorder, y + opBorder + opSpace*i, options[menuLevel, i], _c, _c,_c,_c, 1);
}







