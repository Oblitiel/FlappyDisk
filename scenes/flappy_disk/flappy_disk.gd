extends FlappyCharacter

@onready var movement: Node = $Movement

func _ready():
	movement.flappy_disk = self

func _physics_process(delta: float) -> void:
	movement.fall(delta)
	move_and_slide()

func jump():
	movement.jump()
