extends Node2D

const CHARACTER_PATH_FORMAT = "res://scenes/%s/%s.tscn"

var _current_character : FlappyCharacter

func _ready():
	_current_character = _find_current_character()

func _find_current_character() -> FlappyCharacter:
	for child in get_children():
		if child is FlappyCharacter:
			return child
		for child_of_child in child.get_children():
			if child is FlappyCharacter:
				return child
	return null

func change_character(new_character: String, delete: bool = true, keep_running : bool = false) -> FlappyCharacter:
	if delete:
		if _current_character:
			_current_character.queue_free()
	elif keep_running:
		_current_character.hide()
	else:
		remove_child(_current_character)
	
	var new = load(CHARACTER_PATH_FORMAT % [new_character,new_character]).instantiate()
	call_deferred("add_child", new)
	_current_character = new
	
	return get_current_character()

func get_current_character() -> FlappyCharacter:
	return _current_character
