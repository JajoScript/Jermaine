extends Area2D

func _ready():
	$AnimationPlayer.play("caminar")

#FUNCION PARA DEFINIR QUE HACE AL TOCAR EL BODY
func _on_body_entered(body):
	if body.name == "Jermaine":
		body.damage_control(1)
