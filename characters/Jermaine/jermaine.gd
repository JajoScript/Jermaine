# Dependencias.
extends Area2D
signal hit

# Variables.
var speed : int = 400;
var velocity := Vector2.ZERO;
var screen_size;

# Metodos.
func _ready():
	screen_size = get_viewport_rect().size;
	print("[*] SCREEN SIZE", screen_size)

func _process(_delta):
	print("[*] Velocity", velocity)
	
	#* Movimientos.
	if (Input.is_action_pressed("move_right")):
		velocity.x = (velocity.x + 1);
	if (Input.is_action_pressed("move_left")):
		velocity.x = (velocity.x - 1)
	if (Input.is_action_pressed("move_up")):
		velocity.y = (velocity.y - 1)
	if (Input.is_action_pressed("move_down")):
		velocity.y = (velocity.y + 1)
	
	#* Control de la posicion.
	# Para prevenir que el jugador salga de la pantalla.
	position = position + (velocity * _delta);
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

	#* Control de animaciones.
	$Sprite.play();
	
	if (velocity.x != 0):
		$Sprite.animation = "Walk"
		$Sprite.flip_v = false;
		$Sprite.flip_h = (velocity.x < 0);
	if (velocity.y != 0): 
		$Sprite.animation = "Double jump"
		
	else:
		$Sprite.animation = "Idle"
	
