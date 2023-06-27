extends Node2D

@onready var snowman = $"Sprite"

# Called when the node enters the scene tree for the first time.
func _ready():
	snowman.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
