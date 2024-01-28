// Step Event
var mx = mouse_x;
var my = mouse_y;

var textWidth = string_width(txt);
var textHeight = string_height(txt);

// Check if the mouse is over the text
if (mx >= text_x && mx <= text_x + textWidth && my >= text_y && my <= text_y + textHeight) {
    // Start dragging on mouse press
    if (mouse_check_button_pressed(mb_left)) {
        is_dragging = true;
    }
}

// Update text position if dragging
if (is_dragging) {
    text_x = mx - textWidth / 2;
    text_y = my - textHeight / 2;
}

// Stop dragging on mouse release
if (mouse_check_button_released(mb_left)) {
    is_dragging = false;
}


//if clicked the click box
		if(is_dragging = 0){
			if(place_meeting(text_x,text_y, obj_click_box1)){
				obj_gm.curr_product.ans1 = txt;
				obj_gm.need_spawn = true;
				text_x -= 100;
				audio_play_sound(Select_Text, 10, false);

			}
			if(place_meeting(text_x,text_y, obj_click_box2)){
				obj_gm.curr_product.ans2 = txt;
				obj_gm.need_spawn = true;
				text_x -= 100;
				audio_play_sound(Select_Text, 10, false);
			}
			if(place_meeting(text_x,text_y, obj_click_box3)){
				obj_gm.curr_product.ans3 = txt;
				obj_gm.need_spawn = true;
				text_x -= 100;
				audio_play_sound(Select_Text, 10, false);
				
			}
		}
		
	if(obj_gm.gamestate = GameState.Showcase){
		instance_destroy(self);
	}
		