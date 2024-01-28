//capture keyboard input;
if (string_length(keyboard_string) < 20){
	input_string = keyboard_string;
}
else {
    // stop keyboard_string if it exceeds 20 characters
    keyboard_string = string_copy(keyboard_string, 1, 20);
    input_string = keyboard_string;
}

// Handling backspace for text correction
if (keyboard_check_pressed(vk_backspace) && string_length(input_string) > 0) {
    input_string = string_delete(input_string, string_length(input_string), 1);
}
