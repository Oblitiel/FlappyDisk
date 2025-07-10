class_name ScoreArea
extends Area2D

signal player_scored()

func _ready():
	_connect_body_entered_from_area2d()

func _connect_body_entered_from_area2d() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body : Node2D) -> void:
	if body is FlappyCharacter:
		player_scored.emit()
