extends CanvasGroup

var _region_rects : Dictionary = {
	"top" : Rect2(0,0,32,11),
	"top_exp" : Rect2(0,11,32,7),
	"middle" : Rect2(0,18,32,15),
	"bottom_exp" : Rect2(0,33,32,4),
	"bottom": Rect2(0,37,32,6)
}

const MINIMUN_HEIGHT : int = 32
const TEXTURE = preload("res://assets/ObstaclePC.png")

@export_range(MINIMUN_HEIGHT, 128, 1, "suffix:px","or_greater") var height : int = 32 :
	set = set_height

func _ready():
	create_sprites()

func create_sprites():
	var diff : int = height - MINIMUN_HEIGHT
	var max_bottons_sections = diff / 4
	var max_top_sections = diff / 7
	
	add_child(create_single_sprite("top"))

func delete_sprites():
	for child in get_children():
		child.queue_free()

func set_height(new_height : int) -> void:
	height = new_height
	delete_sprites()
	create_sprites()

func create_single_sprite(rect : String) -> Sprite2D:
	var sprite : Sprite2D= Sprite2D.new()
	
	sprite.texture = TEXTURE
	
	sprite.region_enabled = true
	sprite.region_filter_clip_enabled = true
	sprite.region_rect = _region_rects[rect]
	
	return sprite
