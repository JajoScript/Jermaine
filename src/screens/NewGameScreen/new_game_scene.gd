extends Node2D



func _ready():
	$Timer.start()

func _process(_delta):
	pass


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://src/levels/Mundo_01.tscn")
	pass # Replace with function body.
