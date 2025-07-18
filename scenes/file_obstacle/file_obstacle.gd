extends MovableObstacle

signal screen_exited(obstacle : Obstacle)

@export var initial_velocity : float = 100
@export var direction : Vector2 = Vector2(-1,0)

func _ready():
	super()
	if not velocity:
		velocity = initial_velocity * direction

func _physics_process(delta):
	move(delta)

func _on_visible_on_screen_notifier_2d_screen_exited():
	screen_exited.emit(self)

func _on_body_entered(body : Node2D) -> void:
	super(body)
	if body is FlappyCharacter:
		GameController.instance.player_obstacle_collision()
