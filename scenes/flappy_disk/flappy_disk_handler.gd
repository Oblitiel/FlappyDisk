class_name FlappyDisk
extends CharacterBody2D

@onready var movement: Node = $Movement

func _physics_process(delta: float) -> void:
	movement.move()

func fall(delta):
	movement.fall(delta)

func jump():
	movement.jump()
