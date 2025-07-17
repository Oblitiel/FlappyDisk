extends Control

@onready var label: Label = $VBoxContainer/Label

const MESSAGE = "You got %d point"

func update_message() -> void:
	label.text = MESSAGE % GameController.instance.get_score()
	if GameController.instance.get_score() != 1:
		label.text += "s"


func _on_reset_pressed() -> void:
	GameController.instance.reset_game()

func _on_exit_pressed() -> void:
	GameController.instance.exit_game()

func show_death_menu() -> void:
	show()
	update_message()
	#$VBoxContainer/HBoxContainer/Reset.grab_focus()

func hide_death_menu() -> void:
	hide()
