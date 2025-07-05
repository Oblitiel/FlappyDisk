class_name GameController
extends Node

static var instance : GameController

@onready var _level_manager = $LevelManager
@onready var _player_character_manager = $PlayerCharacterManager
@onready var _ui_manager = $UiManager


func _ready():
	instance = self

func change_level(new_level: String, delete: bool = true, keep_running : bool = false):
	_level_manager.change_level(new_level, delete, keep_running)
