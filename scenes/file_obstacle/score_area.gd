extends ScoreArea

func _on_body_entered(body : Node2D) -> void:
	super(body)
	if body is FlappyCharacter:
		GameController.instance.add_score() 
