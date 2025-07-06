extends Node2D

const CHARACTER_PATH_FORMAT = "res://scenes/%s/%s.tscn"

@export var current_character : FlappyCharacter

func change_character(new_character: String, delete: bool = true, keep_running : bool = false):
	if delete:
		if current_character:
			current_character.queue_free()
	elif keep_running:
		current_character.hide()
	else:
		remove_child(current_character)
	
	var new = load(CHARACTER_PATH_FORMAT % [new_character,new_character]).instantiate()
	add_child(new)
	current_character = new
