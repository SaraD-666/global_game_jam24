//script that allows gml to parsse json
function scr_json_import(_file_name)
{
	//if file exist
	if(file_exists(_file_name))
	{
		var _file, _json_string;
		//save return value to _file, or the first line of the json file
		_file = file_text_open_read(_file_name);
		_json_string = "";//initialize blank string
		
		while (!file_text_eof(_file))//while we are not at the end of the file
		{
			_json_string += file_text_read_string(_file);//add the string to json string
			file_text_readln(_file);//next line
		}
		file_text_close(_file);//close file
		return json_parse(_json_string);//parse it
	}
	else
	{
		//if not exist return undefined
		return undefined;
	}
}