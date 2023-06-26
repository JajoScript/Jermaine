extends CharacterBody2D

@onready var animate = $AnimationPlayer
@onready var sprite = $Sprite2D

var direccion := 0.0
var speed :=120
var jump := - 300
const gravity := 10
	
func _physics_process(delta):
	direccion = Input.get_axis("move_left","move_right")
	velocity.x = direccion * speed
	
	if direccion != 0 :
		sprite.flip_h = direccion < 0
			
	if velocity.x != 0.0 :
		animate.play("run")
	else : 
		animate.play("idle")
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept") :
		velocity.y += jump
		
	if !is_on_floor() :
		velocity.y += gravity
		
	move_and_slide()
