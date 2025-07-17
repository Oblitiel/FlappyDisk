extends Control

var score : int = 0
@onready var label: Label = $Label

func add_score(points : int = 1) -> void:
	score += points
	update_score()

func reset_score() -> void:
	score = 0
	update_score()

func update_score() -> void:
	label.text = str(score)
