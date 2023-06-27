extends Area2D

func _ready():
	$AnimationPlayer.play("move")

#FUNCION PARA DEFINIR QUE HACE AL TOCAR EL BODY
func _on_body_entered(body):
	if body.name == "TestCharacter" :
		body.ser_dañado(1)
		body.changelifebar()
