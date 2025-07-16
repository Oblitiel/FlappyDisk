class_name GameController
extends Node

static var instance : GameController

@onready var _level_manager = $LevelManager
@onready var _player_character_manager = $PlayerCharacterManager
@onready var _ui_manager = $UiManager


func _init():
	instance = self

func change_level(new_level: String, delete: bool = true, keep_running : bool = false):
	_level_manager.change_level(new_level, delete, keep_running)

func change_character(new_character: String, delete: bool = true, keep_running : bool = false):
	_player_character_manager.change_character(new_character, delete, keep_running)

func player_obstacle_collision():
	print("Game Controller")
	_level_manager.get_current_level().stop_obstacles()

func add_score(points : int = 1):
	_ui_manager.add_score(points)
