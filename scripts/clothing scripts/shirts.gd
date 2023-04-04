extends Area2D

#fill this list full of indexes that are shirts
var shirts = [0]

var selected = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	Autoload.clicked.connect(self._receive_signal)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _receive_signal(index):
	if index in shirts:
		$"Sprite2D".visible
	pass
