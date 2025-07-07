class_name MovableObstacle
extends Obstacle

var velocity : Vector2

func move(delta :float = 0.0):
	if delta == 0.0:
		delta = get_physics_process_delta_time() if Engine.is_in_physics_frame() else get_process_delta_time()
	
	position += velocity * delta
