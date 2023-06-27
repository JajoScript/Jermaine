# Dependencias.
extends CharacterBody2D

# Variables.
@export var speed : int = 100;
var axis: Vector2;

var jump := -275
const gravity := 10
var life := 3

@onready var all_interactions = [];
@onready var interactLabel = $"Interaction Components/IntereactLabel"

# Metodos.
func get_axis() -> Vector2:
	# [-1, 0, 1] = (izquierda, centro, derecha)
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	axis.y = int(Input.is_action_pressed("move_up")) - int(Input.is_action_pressed("move_down"))
	
	return axis.normalized();
	
func motion_ctrl() -> void:
	velocity.x = (get_axis().x * speed);
	# velocity.y = (get_axis().y * -(speed*2));

func damage_control( damage : int ) -> void:
	life -= damage
	$Camera2D/HUB/Sprite2D.frame += damage

func move_animation() -> void:
	if (velocity.x != 0 and velocity.y == 0):
		$Sprite.play("Run")
		$Sprite.flip_h = (velocity.x < 0);
		# $CollisionShape2D.flip_h = (velocity.x < 0);
		
	elif (velocity.y != 0):
		$Sprite.play("Double jump");
		$Sprite.flip_h = (velocity.x < 0)
	else:
		$Sprite.play("Idle")

func _input(event):
	if Input.is_action_just_pressed("menu") and get_tree().paused == false:
		get_tree().paused = true
	#	$Pause.visible = true

# Procesos.
func _ready():
	interactLabel.visible = false;
func _physics_process(_delta):
	# Interacción
	if Input.is_action_just_pressed("interact"):
		execute_interaction()
	
	# Salto.
	if is_on_floor() and Input.is_action_just_pressed("move_up"):
		velocity.y += jump
		
	if !is_on_floor() :
		velocity.y += gravity
		
	move_and_slide();
	
func _process(_delta):
	# Animaciones
	$Sprite.play()
	$"Interaction Components/KeySprite".play()
	
	# Control del jugador.
	motion_ctrl();
	if life <= 0:
		queue_free()
	move_animation();


# Interaction methods.
func _on_interact_area_area_entered(area):
	all_interactions.insert(0, area)
	update_interaction()

func _on_interact_area_area_exited(area):
	all_interactions.erase(area)
	update_interaction()

func update_interaction():
	# Mostrar u ocultar el botón de interacción
	if all_interactions:
		$"Interaction Components/KeySprite".visible = true;
	else:
		$"Interaction Components/KeySprite".visible = false;
		interactLabel.visible = false;
		interactLabel.text = ""
		

func execute_interaction():
	if all_interactions:
		var cur_interaction = all_interactions[0]
		
		match cur_interaction.interact_type:
			"print_text":
				$"Interaction Components/KeySprite".visible = false;
				interactLabel.visible = true;
				interactLabel.text = cur_interaction.interact_value


func _on_pause_pressed():
	pass # Replace with function body.


func _on_continue_pressed():
	$Pause.visible = false
	get_tree().paused = false
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://src/screens/MainScreen/main.tscn")
	pass # Replace with function body.
