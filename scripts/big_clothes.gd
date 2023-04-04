extends Area2D

var touching = false
var clicked = false

var index 

@onready var sprite = get_node("Sprite2D")
@onready var texture = sprite.get_texture()
@onready var textureSize = texture.get_size()

@onready var grabRadius = (textureSize.x+textureSize.y)/2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input_event(viewport, event, shape_idx):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ((abs(position.x - get_global_mouse_position().x) <= grabRadius) and (abs(position.y - get_global_mouse_position().y) <= grabRadius)):
		touching = true
	else:
		touching = false
	
	if (touching and clicked):
		position = get_global_mouse_position()
	
	pass
