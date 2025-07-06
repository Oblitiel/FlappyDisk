extends Node2D

@export var _current_level : Level
const SCENE_PATH_FORMAT = "res://scenes/levels/%s.tscn"

func change_level(new_level: String, delete: bool = true, keep_running : bool = false) -> Level:
	if delete:
		if _current_level:
			_current_level.queue_free()
	elif keep_running:
		_current_level.hide()
	else:
		remove_child(_current_level)
	
	var new = load(SCENE_PATH_FORMAT % new_level).instantiate()
	add_child(new)
	_current_level = new
	
	return get_current_level()

func get_current_level() -> Level:
	return _current_level
