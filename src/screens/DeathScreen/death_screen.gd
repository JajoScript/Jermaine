extends Node2D

@onready var counterLabel = $"Panel/Counter"
var time = 10

# Base
func _ready():
	pass


func _process(_delta):
	pass


#-- Sistema para el contador.
func volver_intentar():
	get_tree().change_scene_to_file("res://src/levels/Mundo_01/Mundo_01.tscn")


func cerrar_juego():
	get_tree().quit()


func _on_timer_timeout():
	counterLabel.text = str(time - 1)
	
	if (time == 0):
		cerrar_juego()
	else:
		time = (time - 1)


func _on_retry_button_button_up():
	volver_intentar();


func _on_exit_button_button_up():
	cerrar_juego()
