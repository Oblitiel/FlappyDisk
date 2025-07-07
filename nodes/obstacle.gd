class_name Obstacle
extends Area2D

signal player_entered()

func _ready():
	_connect_body_entered_from_area2d()

func _connect_body_entered_from_area2d() -> void:
	body_entered.connect(_on_body_entered)



func _on_body_entered(body : Node2D) -> void:
	if body is FlappyCharacter:
		GameController.instance.on_player_obstacle_collision()
