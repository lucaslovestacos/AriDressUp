extends Area2D

var screen_size

#fill this list full of indexes that are head
var sock = [51,52,53,54,55,56,57,58]
var textures = [preload("res://art/finals/socks/black.png"),preload("res://art/finals/socks/white.png"),preload("res://art/finals/socks/red.png"),preload("res://art/finals/socks/stripe black.png"),preload("res://art/finals/socks/stripe red.png"),preload("res://art/finals/socks/stsocks.png"),preload("res://art/finals/socks/cat.png"),preload("res://art/finals/socks/cat 2.png")]
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
