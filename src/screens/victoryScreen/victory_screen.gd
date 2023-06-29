extends Node2D


#* -- Base.
func _ready():
	pass


func _process(_delta):
	pass


#* -- Interaccion.
func _on_button_main_menu_button_up():
	get_tree().change_scene_to_file("res://src/screens/MainScreen/main.tscn")


func _on_button_exit_button_up():
	get_tree().quit()
