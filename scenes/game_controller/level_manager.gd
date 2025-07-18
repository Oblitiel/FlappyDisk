extends Node2D

var _current_level : Level
const SCENE_PATH_FORMAT = "res://scenes/levels/%s.tscn"

func _ready():
	_current_level = _find_current_level()

func _find_current_level() -> Level:
	for child in get_children():
		if child is Level:
			return child
		for child_of_child in child.get_children():
			if child is Level:
				return child
	return null

func change_level(new_level: String, delete: bool = true, keep_running : bool = false) -> Level:
	if delete:
		if _current_level:
			_current_level.queue_free()
	elif keep_running:
		_current_level.hide()
	else:
		remove_child(_current_level)
	
	var new = load(SCENE_PATH_FORMAT % new_level).instantiate()
	call_deferred("add_child", new)
	_current_level = new
	
	return get_current_level()

func get_current_level() -> Level:
	return _current_level
