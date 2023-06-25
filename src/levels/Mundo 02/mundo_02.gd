extends Node2D

@onready var enemy = $Kapedrin

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	prepare_enemy()

# Funciones para el enemigo.
func prepare_enemy():
	var enemySprite = enemy.get_child(0)
	enemySprite.play("ATTACK")
	
	# Girar al enemigo.
	enemySprite.flip_h = true;
