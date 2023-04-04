extends Area2D

var screen_size

#fill this list full of indexes that are head
var eyes = [7,8,9,10,11,12,13]
var textures = [preload("res://art/finals/eyes/ari glasses.png"),preload("res://art/finals/eyes/circle glasses.png"),preload("res://art/finals/eyes/crumb glasses.png"),preload("res://art/finals/eyes/sunglasses.png"),preload("res://art/finals/eyes/green.png"),preload("res://art/finals/eyes/pink.png"),preload("res://art/finals/eyes/goggles y.png")]
var selected = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	
	Autoload.clicked.connect(self._receive_signal)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	screen_size = get_viewport_rect().size
	position = screen_size/2
	
	pass

func _receive_signal(index):
	if index in eyes:
		if (index == selected):
			$"Sprite2D".visible = false
			selected = -1
		else:
			$"Sprite2D".visible = true
			var x = eyes.find(index)
			$"Sprite2D".set_texture(textures[x])
			selected = index
