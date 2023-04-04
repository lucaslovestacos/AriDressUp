extends Area2D

var screen_size

#fill this list full of indexes that are head
var pants = [46,47,48,49,50]
var textures = [preload("res://art/finals/pants/shorts 1.png"),preload("res://art/finals/pants/shorts 2.png"),preload("res://art/finals/pants/shorts 3.png"),preload("res://art/finals/pants/pants.png"),preload("res://art/finals/pants/pants 2.png")]
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
	if (index in [43,44,45]):
		$"Sprite2D".visible = false
		selected = -1
	else:
		if index in pants:
			if (index == selected):
				$"Sprite2D".visible = false
				selected = -1
			else:
				$"Sprite2D".visible = true
				var x = pants.find(index)
				$"Sprite2D".set_texture(textures[x])
				selected = index
