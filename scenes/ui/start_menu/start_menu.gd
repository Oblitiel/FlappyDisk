extends Control


func _on_start_pressed() -> void:
	GameController.instance.reset_game()
	hide()

func _on_exit_pressed() -> void:
	GameController.instance.exit_game()
