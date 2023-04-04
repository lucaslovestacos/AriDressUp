extends Area2D

var screen_size

#fill this list full of indexes that are head
var tail = [59,60,61,62,63]
var textures = [preload("res://art/finals/tail/tail.png"),preload("res://art/finals/tail/pink.png"),preload("res://art/finals/tail/black.png"),preload("res://art/finals/tail/gold.png"),preload("res://art/finals/tail/coral.png")]
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
	if index in tail:
		if (index == selected):
			$"Sprite2D".visible = false
			selected = -1
		else:
			$"Sprite2D".visible = true
			var x = tail.find(index)
			$"Sprite2D".set_texture(textures[x])
			selected = index
