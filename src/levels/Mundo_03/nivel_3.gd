extends Node2D

@onready var snowman = $"Snowman/Sprite"

# Called when the node enters the scene tree for the first time.
func _ready():
	snowman.flip_h = true;


func _process(_delta):
	pass
