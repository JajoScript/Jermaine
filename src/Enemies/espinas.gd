extends Area2D

func _on_body_entered(body):
	if body.name == "Jermaine" :
		body.damage_control(3)
