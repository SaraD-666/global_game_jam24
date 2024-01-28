randomize();
//states machine
switch(gamestate){
	case GameState.Multiplayer:
		obj_stage1_img.visible = true;
		obj_stage1_strs.visible = true;
		
		//only spawn once when it first entered
		if (need_spawn){
			description1 = "";
			description2 = "";
			description3 = "";
			
			if(next_page){
				randomize();
				rand_index = irandom_range(0, products_num - 1);
				next_page = false;
			}
		
			//save the selected index on the 
			arr_selected[array_length(arr_selected)] = rand_index;
		
			//get the corresponding product through rand_index
			curr_product = products_struct[rand_index];
			curr_sprite = scr_converter(curr_product.image);
			show_debug_message(typeof(curr_product.image));
			
			var placeholder = " _________ ";
			
			//first string
			var curr_str1 = curr_product.str1;
			//description1 = "1. "
			//if it is an array
			if (is_array(curr_str1)){
				//loop through the array
		        for (var i = 0; i < array_length(curr_str1); i++) {
					//if it is space
					if (curr_str1[i] == "space") {
						//if there's no input
						if (curr_product.input1 == ""){
							description1 += placeholder;
						}
						else {//if there's input
							description1 += " " + curr_product.input1 + " ";
						}
					}
					else{//if it's not a space
						description1 += curr_str1[i];
					}
				}
			}
			else{//if it's just a string
				description1 = curr_str1;
			}
			
			//Second string
			var curr_str2 = curr_product.str2;
			//description2 = "2. "
			//if it is an array
			if (is_array(curr_str2)){
				//loop through the array
		        for (var i = 0; i < array_length(curr_str2); i++) {
					//if it is space
					if (curr_str2[i] == "space") {
						//if there's no input
						if (curr_product.input2 == ""){
							description2 += placeholder;
						}
						else {//if there's input
							description2 += " " + curr_product.input2 + " ";
						}
					}
					else{//if it's not a space
						description2 += curr_str2[i];
					}
				}
			}
			else{//if it's just a string
				description2 = curr_str2;
			}
			
			//Third string
			var curr_str3 = curr_product.str3;
			//description3 = "3. "
			//if it is an array
			if (is_array(curr_str3)){
				//loop through the array
		        for (var i = 0; i < array_length(curr_str3); i++) {
					//if it is space
					if (curr_str3[i] == "space") {
						//instance_create_layer
						//if there's no input
						if (curr_product.input3 == ""){
							description3 += placeholder;
						}
						else {//if there's input
							description3 += " " + curr_product.input3 + " ";
						}
					}
					else{//if it's not a space
						description3 += curr_str3[i];
					}
				}
			}
			else{//if it's just a string
				description3 = curr_str3;
			}
			need_spawn = false;
		}
		
		//if clicked the click box 1
		if(position_meeting(mouse_x,mouse_y, obj_click_box1)){
			if(mouse_check_button_released(mb_left)){
				click_num = 1;
				gamestate = GameState.InputText;
			}
		}
		//if clicked the click box 2
		if(position_meeting(mouse_x,mouse_y, obj_click_box2)){
			if(mouse_check_button_released(mb_left)){
				click_num = 2;
				gamestate = GameState.InputText;
			}
		}
		//if clicked the click box 3
		if(position_meeting(mouse_x,mouse_y, obj_click_box3)){
			if(mouse_check_button_released(mb_left)){
				click_num = 3;
				gamestate = GameState.InputText;
			}
		}
		
	break;
	case GameState.Singleplayer:
	
	break;
	case GameState.InputText:
		// if it's in the input mode, create obj_input
		instance_create_layer(683, 650, "UI_Instance", obj_input);
		//if clicked the click box 2
		// Check for enter key and update player input
		if (keyboard_check_pressed(vk_enter) && string_length(obj_input.input_string) > 0) {
			if (click_num == 1){
				curr_product.input1 = obj_input.input_string;
			}
			if (click_num == 2){
				curr_product.input2 = obj_input.input_string;
			}
			if (click_num == 3){
				curr_product.input3 = obj_input.input_string;
			}
		
			obj_input.input_string = ""; // Reset the input string
			keyboard_string = ""; //clear keyboard
		
			instance_destroy(obj_input);
			gamestate = GameState.Multiplayer;
			need_spawn = true;
		}
	break;
	case GameState.ResultDisplay:
	
	break;
	case GameState.DragAndDrop:
	
	break;
}

