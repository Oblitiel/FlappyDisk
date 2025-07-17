extends Node

func pause_game() -> void:
	get_tree().paused = true

func resume_game() -> void:
	get_tree().paused = false

func is_game_paused() -> bool:
	return get_tree().paused
