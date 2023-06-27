extends Area2D


func _on_body_entered(body):
	if body.name == "TestCharacter" :
		body.ser_dañado(3)
