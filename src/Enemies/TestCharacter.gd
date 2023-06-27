extends CharacterBody2D

@onready var animate = $AnimatedSprite2D
@onready var life = $Camera2D/HUB/Sprite2D
var direccion := 0.0
var speed :=120
var jump := - 300
const gravity := 10
var vida := 3

func ser_dañado ( daño : int ) -> void :
	vida -= daño
	
func changelifebar () -> void :
	life.frame += 1
	
func _physics_process(_delta):
	direccion = Input.get_axis("move_left","move_right")
	velocity.x = direccion * speed
	
	if direccion != 0 :
		animate.flip_h = direccion < 0
			
	if velocity.x != 0.0 :
		animate.play("walk")
	else : 
		animate.play("idle")
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept") :
		velocity.y += jump
		
	if !is_on_floor() :
		velocity.y += gravity
		
	if vida <= 0 :
		queue_free()
		
	move_and_slide()
