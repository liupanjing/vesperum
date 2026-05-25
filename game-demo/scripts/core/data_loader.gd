class_name DataLoader
extends RefCounted

func load_json_array(path: String) -> Array:
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Cannot open data file: " + path)
		return []

	var text := file.get_as_text()
	var parsed := JSON.parse_string(text)
	if typeof(parsed) != TYPE_ARRAY:
		push_error("Expected JSON array in: " + path)
		return []

	return parsed
