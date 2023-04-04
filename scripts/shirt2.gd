extends Area2D

var screen_size

#fill this list full of indexes that are head
var shirts = [28,29,30,31,32,33,34,35,36,37,38,39,40,41,42]
var textures = [preload("res://art/finals/shirt/shirt.png"),preload("res://art/finals/shirt/shirt 2.png"),preload("res://art/finals/shirt/shirt 3.png"),preload("res://art/finals/shirt/shirt 4.png"),preload("res://art/finals/shirt/green.png"),preload("res://art/finals/shirt/yellow.png"),preload("res://art/finals/shirt/white.png"),preload("res://art/finals/shirt/red.png"),preload("res://art/finals/shirt/spooky tuck.png"),preload("res://art/finals/shirt/white tuck.png"),preload("res://art/finals/shirt/purple tuck.png"),preload("res://art/finals/shirt/opend1.png"),preload("res://art/finals/shirt/black sweater.png"),preload("res://art/finals/shirt/white sweater.png"),preload("res://art/finals/shirt/yellow sweater.png")]
var selected = -1
var next = -1

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
		next = -1
	else:
		if index in shirts:
			if next in shirts:
				if (next == selected or next == index):
					$"Sprite2D".visible = false
					selected = -1
					next = -1
				else:
					$"Sprite2D".visible = true
					var x = shirts.find(next)
					$"Sprite2D".set_texture(textures[x])
					selected = next
			else:
				$"Sprite2D".visible = false
				selected = -1
				next = -1
			next = index
