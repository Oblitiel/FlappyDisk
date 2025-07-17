extends CanvasLayer

@onready var score_ui: Control = $"Score UI"
@onready var death_menu: Control = $"Death Menu"

func add_score(points : int = 1) -> void:
	score_ui.add_score(points)

func reset_score() -> void:
	score_ui.reset_score()

func get_score() -> int:
	return score_ui.score

func show_death_menu() -> void:
	death_menu.show_death_menu()

func hide_death_menu() -> void:
	death_menu.hide_death_menu()
