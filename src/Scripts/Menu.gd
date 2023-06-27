extends Control


func _ready():
	var botonMenu = preload("res://Menu.gd")
	var botones = ["Jugar", "Opciones", "Salir"]
	
	for i in range(botones.size()):
		var instance = botonMenu.instance()
		instance.text = botones[i]
		match i:
			0:
				instance.connect("pressed", self, "load_scene", ["res://src/levels/Mundo_01.tscn"])
			1:
				instance.connect("pressed", self, "quit")
		$CenterContainer/PanelContainer/Botones.add_child(instance)

func load_scene(scene: String) -> void:
	var error_code = get_tree().change_scene(scene)
	if error_code != 0:
		print("error", error_code)

