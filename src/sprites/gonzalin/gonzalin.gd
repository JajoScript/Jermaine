extends CharacterBody2D

func _ready():
	pass

func _process(_delta):
	animate();
	
func animate():
	$Sprite.play("Idle")
