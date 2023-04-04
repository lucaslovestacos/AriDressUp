extends Area2D

var screen_size

#fill this list full of indexes that are head
var neck = [14,15,16,17,18,19,20,21,22,23]
var textures = [preload("res://art/finals/neck/collar.png"),preload("res://art/finals/neck/spike collar.png"),preload("res://art/finals/neck/necklace 1.png"),preload("res://art/finals/neck/necklace 2.png"),preload("res://art/finals/neck/tie.png"),preload("res://art/finals/neck/bow.png"),preload("res://art/finals/neck/black.png"),preload("res://art/finals/neck/white.png"),preload("res://art/finals/neck/red.png"),preload("res://art/finals/neck/yellow.png")]
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
	if index in neck:
		if (index == selected):
			$"Sprite2D".visible = false
			selected = -1
		else:
			$"Sprite2D".visible = true
			var x = neck.find(index)
			$"Sprite2D".set_texture(textures[x])
			selected = index
