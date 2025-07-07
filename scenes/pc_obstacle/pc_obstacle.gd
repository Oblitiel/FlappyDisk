extends MovableObstacle

@export var initial_velocity : Vector2 = Vector2()

func _ready():
	velocity = initial_velocity

func _physics_process(delta):
	move(delta)
