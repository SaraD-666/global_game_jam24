//if visible put the strings in the right position
if (visible){
	draw_self();
	draw_set_color(c_black);
	draw_set_font(ft_default);
	
	//product sprite
	switch(obj_gm.curr_sprite){
		case 1:
			draw_sprite(spr_tacoscope, 0, 404, 310);
		break;
		case 2:
			draw_sprite(spr_matetoilet, 0, 404, 310);
		break;
		case 3:
			draw_sprite(spr_thering, 0, 404, 310);
		break;
		case 4:
			draw_sprite(spr_mushroom, 0, 404, 310);
		break;
		case 5:
			draw_sprite(spr_airplanepillow, 0, 404, 310);
		break;
		case 6:
			draw_sprite(spr_trafficcone, 0, 404, 310);
		break;
		case 7:
			draw_sprite(spr_bike, 0, 404, 310);
		break;
		case 8:
			draw_sprite(spr_burger, 0, 404, 310);
		break;
		case 9:
			draw_sprite(spr_ibrick, 0, 404, 310);
		break;
		case 10:
			draw_sprite(spr_chaircar, 0, 404, 310);
		break;
		case 11:
			draw_sprite(spr_kisskiss, 0, 404, 310);
		break;
		case 12:
			draw_sprite(spr_door, 0, 404, 310);
		break;
		case 13:
			draw_sprite(spr_openworld, 0, 404, 310);
		break;
		case 14:
			draw_sprite(spr_cleaner, 0, 404, 310);
		break;
		case 15:
			draw_sprite(spr_scratch, 0, 404, 310);
		break;
		case 16:
			draw_sprite(spr_subwaysleeper, 0, 404, 310);
		break;
	}
	
	//product name
	draw_text_ext(320, 118, obj_gm.curr_product.ng, 30, 388);
	
	//draw answers
	draw_text_ext(200, 480, obj_gm.answer1, 30, 388);
	draw_text_ext(200, 560, obj_gm.answer2, 30, 388);
	draw_text_ext(200, 640, obj_gm.answer3, 30, 388);
	
}

