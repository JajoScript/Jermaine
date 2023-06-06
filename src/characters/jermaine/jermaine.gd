# Dependencias.
extends Area2D
signal hit

# Variables.
@export var speed : int = 100;
var velocity := Vector2.ZERO;
var axis: Vector2;

# Metodos.
func get_axis() -> Vector2:
	# [-1, 0, 1] = (izquierda, centro, derecha)
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	axis.y = int(Input.is_action_pressed("move_up")) - int(Input.is_action_pressed("move_down"))
	
	return axis.normalized();
	
func motion_ctrl() -> void:
	velocity.x = (get_axis().x * speed);
	velocity.y = (get_axis().y * -speed);

func move_and_slide(delta) -> void:
	position = position + (velocity * delta)

	if (velocity.x != 0):
		$Sprite.play("Walk")
		$Sprite.flip_h = (velocity.x < 0);
	else:
		$Sprite.play("Idle")

# Procesos.
func _process(delta):
	# Animaciones
	$Sprite.play()
	
	# Control del jugador.
	motion_ctrl();
	move_and_slide(delta)
	
	
	
	
