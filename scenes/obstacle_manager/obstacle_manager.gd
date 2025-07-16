extends Marker2D

const FILE_OBSTACLE = preload("res://scenes/file_obstacle/file_obstacle.tscn")

## Velocity of the spawned obstacles
@export var obstacle_velocity : float
@export var obstacle_direction : Vector2 = Vector2(-1,0)
@export var pool_size : int = 5  
@export var position_variation : int = 48

@onready var timer = $Timer

var wait_time : float :
	set = set_wait_time
var pool : Array[Obstacle]

func _ready():
	wait_time = timer.wait_time
	pool = fill_pool(pool_size)

func fill_pool(size : int) -> Array[Obstacle]:
	var new_pool : Array[Obstacle]
	while size > 0:
		new_pool.append(create_obstacle())
		size -= 1
	return new_pool

func create_obstacle() -> Obstacle:
	var obstacle = FILE_OBSTACLE.instantiate()
	obstacle.screen_exited.connect(_on_obstacle_exited)
	return obstacle

func spawn_obstacle():
	var obstacle = pool.pop_front()
		 
	obstacle.position = Vector2(0,randi() % position_variation*2 - position_variation)
	add_child(obstacle)
	
	pool.append(obstacle)

func stop_obstacles():
	timer.paused = true
	for obstacle in pool:
		obstacle.velocity = Vector2(0,0)

func set_wait_time(new_time) -> void:
	wait_time = new_time
	timer.wait_time = wait_time

func _on_timer_timeout() -> void:
	spawn_obstacle()

func _on_obstacle_exited(obstacle : Obstacle):
	remove_child(obstacle)
