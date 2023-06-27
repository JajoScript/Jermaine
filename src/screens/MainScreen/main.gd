extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_btn_nueva_partida_button_up():
	print("Nueva partida!")
	get_tree().change_scene_to_file("res://src/screens/NewGameScreen/new_game_scene.tscn")


func _on_btn_cargar_partida_button_up():
	print("Cargar partida!")


func _on_btn_opciones_button_up():
	print("Opciones!")


func _on_btn_salir_button_up():
	get_tree().quit()
