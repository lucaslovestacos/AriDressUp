extends Area2D

var screen_size
var clothes = load("res://scenes/clothes.tscn")

func generateClothes():
	
	for i in 64:
		var cloth = clothes.instantiate()
		cloth.index = i
		add_sibling.call_deferred(cloth)

func _ready():
	
	generateClothes()
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	screen_size = get_viewport_rect().size
	position = screen_size/2
	
	pass

