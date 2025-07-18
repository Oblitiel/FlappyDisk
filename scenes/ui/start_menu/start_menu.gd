extends Control

func _ready() -> void:
	if OS.get_name() in GameController.non_exit_os:
		$VBoxContainer/Exit.hide()

func _on_start_pressed() -> void:
	GameController.instance.reset_game()
	hide()

func _on_exit_pressed() -> void:
	GameController.instance.exit_game()
