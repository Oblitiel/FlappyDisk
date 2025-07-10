extends MovableObstacle

signal screen_exited()

@export var initial_velocity : Vector2 = Vector2(-100,0)

func _ready():
	super()
	velocity = initial_velocity

func _physics_process(delta):
	move(delta)

func _on_visible_on_screen_notifier_2d_screen_exited():
	screen_exited.emit()
