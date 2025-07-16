extends FlappyCharacter

@onready var movement: Node = $Movement

var can_move : bool = true

func _ready():
	movement.flappy_disk = self

func _physics_process(delta: float) -> void:
	if not can_move: return
	
	movement.fall(delta)
	move_and_slide()

func jump():
	if not can_move: return
	movement.jump()

func die():
	pass
