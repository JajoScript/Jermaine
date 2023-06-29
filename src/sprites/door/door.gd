extends Node2D

@export var is_open = true;
@export var id_level = "";
@export var location = ""; # Comienzo, Final.

# General del nodo.
func _ready():
	changeSprites()
	
func _process(_delta):
	pass
	

# Control de sprites de la puerta.
func changeSprites():
	if (is_open):
		$Sprite.play("Door open")
	else:
		$Sprite.play("Door close")
		
func change_level():
	print(id_level)
	if (id_level == "Mundo_01"):
		if (location == "Comienzo"):
			print("Debo cambiar la Mundo_01")
		elif (location == "Final"):
			print("Debo cambiar la Mundo_02")
			get_tree().change_scene_to_file("res://src/levels/Mundo 02/mundo_02.tscn")
		
	elif (id_level == "Mundo_02"):
		if (location == "Comienzo"):
			print("Debo cambiar la Mundo_01")
		elif (location == "Final"):
			print("Debo cambiar la Mundo_03")
			get_tree().change_scene_to_file("res://src/levels/Mundo_03/nivel_3.tscn")
	
	elif (id_level == "Mundo_03"):
		if (location == "Comienzo"):
			print("niuna wea")
		elif (location == "Final"):
			get_tree().change_scene_to_file("res://src/screens/victoryScreen/victory_screen.tscn")


func _on_area_2d_body_entered(_body):
	if (_body.name != "Jermaine" && _body.name != "TestCharacter"):
		return
	
	if (is_open && location == "Final"):
		change_level()
