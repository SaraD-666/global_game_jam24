

if(keyboard_check_pressed(vk_anykey)){
	audio_play_sound(Typing, 10, false);
}

draw_set_color(c_white);
draw_set_font(ft_default);
draw_text(190, 670, "press space to restart");

