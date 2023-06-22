# Dependencias.
extends CharacterBody2D
signal hit

# Variables.
@export var speed : int = 100;
var axis: Vector2;

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
	velocity.y = (get_axis().y * -speed);

func move_animation() -> void:
	if (velocity.x != 0 and velocity.y == 0):
		$Sprite.play("Run")
		$Sprite.flip_h = (velocity.x < 0)
	elif (velocity.y != 0):
		$Sprite.play("Double jump");
		$Sprite.flip_h = (velocity.x < 0)
	else:
		$Sprite.play("Idle")

# Procesos.
func _physics_process(_delta):
	velocity.y += 50
	move_and_slide();
	
	if Input.is_action_just_pressed("interact"):
		execute_interaction()
	
func _process(_delta):
	# Animaciones
	$Sprite.play()
	
	# Control del jugador.
	motion_ctrl();
	move_animation();


# Interaction methods.
func _on_interact_area_area_entered(area):
	all_interactions.insert(0, area)
	update_interaction()

func _on_interact_area_area_exited(area):
	all_interactions.erase(area)
	update_interaction()

func update_interaction():
	if all_interactions:
		interactLabel.text = all_interactions[0].interact_label
	else:
		interactLabel.text = ""

func execute_interaction():
	if all_interactions:
		var cur_interaction = all_interactions[0]
		
		match cur_interaction.interact_type:
			"print_text":
				print(cur_interaction.interact_value)
				interactLabel.text = cur_interaction.interact_value
