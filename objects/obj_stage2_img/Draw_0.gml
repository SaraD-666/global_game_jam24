if (visible){
	//draw
	draw_self();

	switch(obj_gm.curr_sprite){
		case 1:
			draw_sprite(spr_tacoscope, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 2:
			draw_sprite(spr_matetoilet, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 3:
			draw_sprite(spr_thering, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 4:
			draw_sprite(spr_mushroom, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 5:
			draw_sprite(spr_airplanepillow, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 6:
			draw_sprite(spr_trafficcone, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 7:
			draw_sprite(spr_bike, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 8:
			draw_sprite(spr_burger, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 9:
			draw_sprite(spr_ibrick, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 10:
			draw_sprite(spr_chaircar, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 11:
			draw_sprite(spr_kisskiss, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 12:
			draw_sprite(spr_door, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 13:
			draw_sprite(spr_openworld, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 14:
			draw_sprite(spr_cleaner, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 15:
			draw_sprite(spr_scratch, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
		case 16:
			draw_sprite(spr_subwaysleeper, 0, obj_gm.stage1_img_x, obj_gm.stage1_img_y);
		break;
	}
}
