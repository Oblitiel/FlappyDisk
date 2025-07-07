class_name Obstacle
extends Area2D

signal player_entered()

func _ready():
	_connect_body_entered_from_area2d()
	_connect_player_entered_to_game_controller()

func _connect_body_entered_from_area2d() -> void:
	body_entered.connect(_on_body_entered)

func _connect_player_entered_to_game_controller() -> void:
	player_entered.connect(GameController.instance.on_player_obstacle_colision)

func _on_body_entered(body : Node2D) -> void:
	if body is FlappyCharacter:
		player_entered.emit()
