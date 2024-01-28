//if visible put the strings in the right position
if (visible){
	draw_self();
	draw_set_color(c_white);
	draw_set_font(ft_default);
	draw_text_ext(760, 180, obj_gm.description1, 30, 388);
	draw_text_ext(760, 340, obj_gm.description2, 30, 388);
	draw_text_ext(760, 500, obj_gm.description3, 30, 388);
	
}

