extends CanvasLayer

@onready var score_ui: Control = $"Score UI"

func add_score(points : int = 1) -> void:
	score_ui.add_score(points)

func reset_score() -> void:
	score_ui.reset_score()
