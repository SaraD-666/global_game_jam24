//all the game states
enum GameState{
  Multiplayer,
  Singleplayer,
  InputText,
  SetName,
  DragAndDrop,
  InputText1,
  Showcase
}

audio_stop_sound(Hell_Sell);
audio_play_sound(Hell_Sell_Title_Theme, 10, false);

//initial gamestate
gamestate = GameState.Multiplayer;

//stage1 img position
stage1_img_x = obj_stage1_img.x;
stage1_img_y = obj_stage1_img.y;


//import product struct
products_struct = scr_json_import("product.json");
products_num = 16;

//selected products index
arr_selected = [];

//obj_stage1_img strings
description1 = "";
description2 = "";
description3 = "";

answer1 = "";
answer2 = "";
answer3 = "";

response1 = "";
response2 = "";
response3 = "";

//current product struct
curr_product = {};
curr_sprite = 0;

need_spawn = true;
next_page = true;
is_ready = false;
change_input = false;
change_ng = false;
change_nw = false;
can_dictionary = false;
stage1 = true;
stage2 = false;
click_num = 0;
name = "";
round_num = 1;


//print products struct
for (var i = 0; i < array_length(products_struct); i++){
	var product = products_struct[i];
	var productInfo = "Product " + string(i) + ": ";
	
	productInfo += "image=" + product.image + ", ";
	productInfo += "ng=" + product.ng + ", ";
	productInfo += "nw=" + product.nw + ", ";
	//if strs are array
	if (is_array(product.str1)) {
        productInfo += "str1=[";
        for (var j = 0; j < array_length(product.str1); j++) {
            productInfo += product.str1[j];
            if (j < array_length(product.str1) - 1) {
                productInfo += ", ";
            }
        }
        productInfo += "], ";
    } else {
        productInfo += "str1=" + product.str1 + ", ";
    }
	if (is_array(product.str2)) {
        productInfo += "str2=[";
        for (var j = 0; j < array_length(product.str2); j++) {
            productInfo += product.str2[j];
            if (j < array_length(product.str2) - 1) {
                productInfo += ", ";
            }
        }
        productInfo += "], ";
    } else {
        productInfo += "str1=" + product.str2 + ", ";
    }
	if (is_array(product.str3)) {
        productInfo += "str3=[";
        for (var j = 0; j < array_length(product.str3); j++) {
            productInfo += product.str3[j];
            if (j < array_length(product.str3) - 1) {
                productInfo += ", ";
            }
        }
        productInfo += "], ";
    } else {
        productInfo += "str1=" + product.str3 + ", ";
    }
	
	productInfo += "ans1=" + product.ans1 + ", ";
	productInfo += "ans2=" + product.ans2 + ", ";
	productInfo += "ans2=" + product.ans3 + ", ";
	productInfo += "input1=" + product.input1 + ", ";
	productInfo += "input2=" + product.input2 + ", ";
	productInfo += "input3=" + product.input3 + ", ";
	
	if (is_array(product.dictionaries)) {
        productInfo += "dictionaries=[";
        for (var j = 0; j < array_length(product.dictionaries); j++) {
            productInfo += product.dictionaries[j];
            if (j < array_length(product.dictionaries) - 1) {
                productInfo += ", ";
            }
        }
        productInfo += "], ";
    } else {
        productInfo += "dictionaries=" + product.dictionaries + ", ";
    }
	
	show_debug_message(productInfo);
	
}
