extends Area2D

@onready var animate = $AnimatedSprite2D

func _ready():
	animate.play("idle")
