class_name FlappyInputHandler
extends Node

@export var controled_character : FlappyCharacter

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump", true):
		jump_action()

func jump_action():
	controled_character.jump()
