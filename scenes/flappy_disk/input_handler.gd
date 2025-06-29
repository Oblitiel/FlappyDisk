extends Node

@export var controledCharacter : CharacterBody2D 

func _physics_process(delta: float) -> void:
	controledCharacter.fall(delta)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump", true):
		controledCharacter.jump()
