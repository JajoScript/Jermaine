extends Node2D

@onready var snowman = $"Sprite"

#* -- Base.
func _ready():
	snowman.play("idle")

func _process(_delta):
	pass

#* -- 
