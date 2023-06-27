extends Area2D

var opened = false
@onready var animate = $AnimationPlayer

func _on_body_entered(body):
	if body.name == "Jermaine":
		if body.life < 3 and !opened:
			opened = true
			body.damage_control(-1)
			animate.play("open")
