extends Node

@export var flappy_disk : CharacterBody2D

@export var jump_force : int = 300
@export var max_fall_velocity : int = 1000

func fall(delta: float) -> void:
	flappy_disk.velocity = flappy_disk.velocity.move_toward(get_fall_vector(), delta * get_fall_acceleration())

func jump():
	flappy_disk.velocity.y = -jump_force

func get_fall_vector() -> Vector2:
	return Vector2(max_fall_velocity, max_fall_velocity) * flappy_disk.get_gravity().normalized()

func get_fall_acceleration() -> float:
	return flappy_disk.get_gravity().length()
