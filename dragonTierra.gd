extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("walking")

func _on_body_entered(body):
	if body.name == "Jermaine" :
		body.damage_control(1)
