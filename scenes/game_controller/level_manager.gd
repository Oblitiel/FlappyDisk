extends Node2D

@export var current_level : Level
const SCENE_PATH_FORMAT = "res://scenes/levels/%s.tscn"

func change_level(new_level: String, delete: bool = true, keep_running : bool = false):
	if delete:
		if current_level:
			current_level.queue_free()
	elif keep_running:
		current_level.hide()
	else:
		remove_child(current_level)
	
	var new = load(SCENE_PATH_FORMAT % new_level).instantiate()
	add_child(new)
	current_level = new
