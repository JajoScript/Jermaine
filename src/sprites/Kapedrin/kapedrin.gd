extends Node2D

# Señales
signal hit(damage);

var damage: int = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_attack_area_body_entered(_body):
	print(_body)
	print("huele a culo")
	emit_signal("hit", damage)
	
