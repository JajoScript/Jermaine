extends Area2D

@onready var animate = $AnimatedSprite2D

func _ready():
	animate.play("idle")
func _on_body_entered(body):
	if body.name == "Jermaine":
		pass
