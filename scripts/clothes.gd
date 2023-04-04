extends Area2D

var touching = false
var clicked = false

var index

signal clonked

var prevPress = false

var clothes = load("res://scenes/big_clothes.tscn")

@onready var screen_size = get_viewport_rect().size

@onready var sprite = $"CollisionShape2D/Sprite2D"
@onready var texture = sprite.get_texture()
@onready var textureSize = texture.get_size()

@onready var grabRadius = (textureSize.x+textureSize.y)/2

@onready var margin = 20
@onready var gridWidth = 8
@onready var gridHeight = 8

func list_files_in_directory(path):
	var files = []
	var dir = DirAccess.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return files

var icons = list_files_in_directory("res://art/icons/")
var longIcons = []
var textures = []

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for i in icons:
		var bigString = "res://art/icons/" + i
		longIcons.append(bigString)
	
	for i in longIcons:
		if (i.ends_with(".import")):
			pass
		else:
			var loadTexture = load(i)
			textures.append(loadTexture)
	
	for i in textures:
		if (not is_instance_of(i, CompressedTexture2D)):
			textures.erase(i)
	
	var totalMargin = (textureSize.x/2)+margin
	var panelWidth = 1.0/3.5
	
	var verticalMargin = (textureSize.y/2)+margin
	
	# fuck this math you will never understand it again
	
	if (((index) % gridWidth) < (gridWidth/2.0)):
		position.x = totalMargin+((((screen_size.x*panelWidth)-totalMargin)-totalMargin)*((1.0/((gridWidth/2.0)-1))*(index % (gridWidth/2))))
	else:
		position.x = (screen_size.x - (screen_size.x*panelWidth)) + totalMargin+((((screen_size.x*panelWidth)-totalMargin)-totalMargin)*((1.0/((gridWidth/2.0)-1))*(index % (gridWidth/2))))
	
	position.y = 7.5+verticalMargin+((((screen_size.y/2.0)-verticalMargin)-verticalMargin)*((1.0/((gridHeight/2.0)-1))*floor(index/gridWidth)))
	
	pass # Replace with function body.

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if ((event.button_index == MOUSE_BUTTON_LEFT) and event.pressed):
				if touching:
					clonked.emit()
					Autoload.clicked.emit(index)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	sprite.set_texture(textures[index])
	
	var singleClick = false
	
	if ((abs(position.x - get_global_mouse_position().x) <= grabRadius) and (abs(position.y - get_global_mouse_position().y) <= grabRadius)):
		touching = true
	else:
		touching = false
	
	screen_size = get_viewport_rect().size
	
	pass

