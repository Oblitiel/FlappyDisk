class_name GameController
extends Node

static var instance : GameController

@onready var _level_manager: Node2D = $Pausable/LevelManager
@onready var _player_character_manager: Node2D = $Pausable/PlayerCharacterManager
@onready var _ui_manager = $UiManager
@onready var pause_manager: Node = $PauseManager


func _init():
	instance = self

func _ready() -> void:
	pause_game()

func change_level(new_level: String, delete: bool = true, keep_running : bool = false):
	_level_manager.change_level(new_level, delete, keep_running)

func change_character(new_character: String, delete: bool = true, keep_running : bool = false):
	_player_character_manager.change_character(new_character, delete, keep_running)

func player_obstacle_collision():
	pause_game()
	_ui_manager.show_death_menu()

func add_score(points : int = 1):
	_ui_manager.add_score(points)

func get_score() -> int:
	return _ui_manager.get_score()

func pause_game() -> void:
	pause_manager.pause_game()

func resume_game() -> void:
	pause_manager.resume_game()

func is_game_paused() -> bool:
	return pause_manager.is_game_paused

func reset_game() -> void:
	resume_game()
	change_level("main_level")
	change_character("flappy_disk")
	_ui_manager.reset_score()
	_ui_manager.hide_death_menu()

func exit_game() -> void:
	get_tree().quit()
