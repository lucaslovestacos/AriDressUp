extends Area2D

var screen_size

#fill this list full of indexes that are head
var sock = [24,25,26,27]
var textures = [preload("res://art/finals/arms/bracelets.png"),preload("res://art/finals/arms/red.png"),preload("res://art/finals/arms/white.png"),preload("res://art/finals/arms/yellow.png")]
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
	if index in sock:
		if (index == selected):
			$"Sprite2D".visible = false
			selected = -1
		else:
			$"Sprite2D".visible = true
			var x = sock.find(index)
			$"Sprite2D".set_texture(textures[x])
			selected = index
