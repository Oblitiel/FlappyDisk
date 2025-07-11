extends Marker2D

const FILE_OBSTACLE = preload("res://scenes/file_obstacle/file_obstacle.tscn")

## Velocity of the spawned obstacles
@export var obstacle_velocity : float
@export var obstacle_direction : Vector2 = Vector2(-1,0)
@export var pool_size : int = 5

var wait_time : float :
	set = set_wait_time
var timer : Timer
var pool : Array[Obstacle]

func _ready():
	wait_time = timer.wait_time
	pool = spawn_pool(pool_size)
	print(pool.size())

func spawn_pool(size : int) -> Array[Obstacle]:
	var new_pool : Array[Obstacle]
	while size > 0:
		new_pool.append(create_obstacle())
		--size
	return new_pool

func create_obstacle() -> Obstacle:
	var obstacle = FILE_OBSTACLE.instantiate()
	return obstacle

func set_wait_time(new_time) -> void:
	wait_time = new_time
	timer.wait_time = wait_time

func _on_timer_timeout() -> void:
	pass
