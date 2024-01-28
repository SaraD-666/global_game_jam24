randomize();

if(keyboard_check_pressed(vk_anykey)){
	audio_play_sound(Typing, 10, false);
}
if(mouse_check_button_pressed(mb_left)){
	audio_play_sound(Click, 10, false);
}

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
				is_ready = false;
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
		
		answer1 = description1;
		answer2 = description2;
		answer3 = description3;
		
		//if clicked the click box 1
		if(position_meeting(mouse_x,mouse_y, obj_click_box1)){
			if(mouse_check_button_released(mb_left)){
				change_input = true;
				click_num = 1;
				audio_play_sound(Select_Text, 10, false);
				gamestate = GameState.InputText;
			}
		}
		//if clicked the click box 2
		if(position_meeting(mouse_x,mouse_y, obj_click_box2)){
			if(mouse_check_button_released(mb_left)){
				change_input = true;
				click_num = 2;
				audio_play_sound(Select_Text, 10, false);
				gamestate = GameState.InputText;
			}
		}
		//if clicked the click box 3
		if(position_meeting(mouse_x,mouse_y, obj_click_box3)){
			if(mouse_check_button_released(mb_left)){
				change_input = true;
				click_num = 3;
				audio_play_sound(Select_Text, 10, false);
				gamestate = GameState.InputText;
			}
		}
		
		//if clicked the save button
		if(position_meeting(mouse_x,mouse_y, obj_save_but)){
			if(mouse_check_button_released(mb_left) && is_ready){
				gamestate = GameState.SetName;
				stage1 = true;
				stage2 = false;
				obj_stage1_img.visible = false;
				obj_stage1_strs.visible = false;
				is_ready = false;
				audio_play_sound(Menu_Button_Press_Down, 10, false);
			}
		}
		//if clicked the home button
		if(position_meeting(mouse_x,mouse_y, obj_home_but)){
			if(mouse_check_button_released(mb_left)){
				audio_play_sound(Menu_Button_Press_Down, 10, false);
				room_goto(rm_start);
			}
		}
		
	break;
	case GameState.Singleplayer:
	
	break;
	case GameState.InputText:
		// if it's in the input mode, create obj_input
		instance_create_layer(683, 650, "Instances_2", obj_input);
		
		if (change_input){
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
				change_input = false;
			}
		}
		
		if (change_ng){
		// Check for enter key and update player input
			if (keyboard_check_pressed(vk_enter) && string_length(obj_input.input_string) > 0) {
				curr_product.ng = obj_input.input_string;
		
				obj_input.input_string = ""; // Reset the input string
				keyboard_string = ""; //clear keyboard
		
				instance_destroy(obj_input);
				gamestate = GameState.SetName;
				change_ng = false;
			}
		}
		if (change_nw){
		// Check for enter key and update player input
			if (keyboard_check_pressed(vk_enter) && string_length(obj_input.input_string) > 0) {
				curr_product.nw = obj_input.input_string;
		
				obj_input.input_string = ""; // Reset the input string
				keyboard_string = ""; //clear keyboard
		
				instance_destroy(obj_input);
				gamestate = GameState.SetName;
				change_nw = false;
			}
		}
		
	break;
	case GameState.SetName:
		instance_create_layer(room_width/2, room_height/2, "Instances_2", obj_set_name);
		
		if(stage1){
			if (curr_product.ng == ""){
				name = "name";
			}
			else{
				name = curr_product.ng;
			}
			
			//if clicked set name box
			if(position_meeting(mouse_x,mouse_y, obj_set_name)){
				if(mouse_check_button_released(mb_left)){
					change_ng = true;
					gamestate = GameState.InputText;
				}
			}
			//if clicked save but
			if(position_meeting(mouse_x,mouse_y, obj_save_but)){
				if(mouse_check_button_released(mb_left) && is_ready){
					gamestate = GameState.DragAndDrop;
					can_dictionary = true;
					audio_play_sound(Menu_Button_Press_Down, 10, false);
					instance_destroy(obj_set_name);
				}
			}
		}
		else if (stage2){
			if (curr_product.nw == ""){
			name = "name";
			}
			else{
				name = curr_product.nw;
			}
			
			//if clicked set name box
			if(position_meeting(mouse_x,mouse_y, obj_set_name)){
				if(mouse_check_button_released(mb_left)){
					change_nw = true;
					gamestate = GameState.InputText;
				}
			}
			//if clicked save but
			if(position_meeting(mouse_x,mouse_y, obj_save_but)){
				if(mouse_check_button_released(mb_left) && is_ready){
					gamestate = GameState.Showcase;
					instance_destroy(obj_set_name);
					audio_play_sound(Menu_Button_Press_Down, 10, false);
				}
			}
		}
		
		need_spawn = true;
		
	break;
	case GameState.DragAndDrop:
		//make two of them visible
		obj_stage1_img.visible = true;
		obj_stage1_strs.visible = true;
		
		//initiate dictoinaries
		curr_dictionary = curr_product.dictionaries;
		curr_dictionary[6] = curr_product.input1;
		curr_dictionary[7] = curr_product.input2;
		curr_dictionary[8] = curr_product.input3;
		
		//first create 9 text boxes that contains these words
		if (can_dictionary){
			for (var i = 0; i < 5; i++){
				var cur_txt_box = instance_create_layer(200 + i * 200, 600, "Instances_1", obj_txt_box);
				cur_txt_box.txt = curr_dictionary[i];
				show_debug_message(curr_dictionary[i]);
		
			}
			for (var i = 5; i < 9; i++){
				var cur_txt_box = instance_create_layer(200 + (i-5) * 200, 700, "Instances_1", obj_txt_box);
				cur_txt_box.txt = curr_dictionary[i];
				show_debug_message(curr_dictionary[i]);
			}
			can_dictionary = false;
		}
		//with the 9 created txt boxes, implement drag and drop function
		
		
		if (need_spawn){
			description1 = "";
			description2 = "";
			description3 = "";
		
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
						if (curr_product.ans1 == ""){
							description1 += placeholder;
						}
						else {//if there's input
							description1 += " " + curr_product.ans1 + " ";
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
						if (curr_product.ans2 == ""){
							description2 += placeholder;
						}
						else {//if there's input
							description2 += " " + curr_product.ans2 + " ";
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
						if (curr_product.ans3 == ""){
							description3 += placeholder;
						}
						else {//if there's input
							description3 += " " + curr_product.ans3 + " ";
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
		//if clicked safe name
		if(position_meeting(mouse_x,mouse_y, obj_save_but)){
			if(mouse_check_button_released(mb_left) && (curr_product.ans1 != "space"&&curr_product.ans2 != "space"&&curr_product.ans3 != "space")){
				stage1 = false;
				stage2 = true;
				gamestate = GameState.SetName;
		
			}
		}
		response1 = description1;
		response2 = description2;
		response3 = description3;
			
	break;
	case GameState.Showcase:
		obj_stage1_img.visible = false;
		obj_stage1_strs.visible = false;
		obj_stage3_p1.visible = true;
		obj_stage3_p2.visible = true;
		
		//if clicked safe name
		if(position_meeting(mouse_x,mouse_y, obj_save_but)){
			if(mouse_check_button_released(mb_left)){
				
				//if played two round goto the end page
				if (round_num >= 2){
					round_num = 0;
					room_goto(rm_end);
				}
				else{
					obj_stage3_p1.visible = false;
					obj_stage3_p2.visible = false;
					gamestate = GameState.Multiplayer;
					round_num += 1;
					next_page = true;
				}
			}
		}
		
		show_debug_message(round_num);
		
		//show player 1 name, player 2 name
		//curr_sprite, curr_sprite,
		//player 1 ans1, player 2 input1,
		//player 1 ans2, player 2, input2,
		//player 1 ans3, player 2, input3

	break;
		
		
		
}