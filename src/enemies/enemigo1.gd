extends CharacterBody2D

const maxSpeed : float = 100
const GRAVITY : float = 25

var motion : Vector2()


func _ready():
	$AnimatedSprite2D.scale.x = -1
	motion.x = maxSpeed
	pass
	
func _next_to_left_wall() -> bool:
	return $izquierda.is_colliding()
	
func _next_to_right_wall() -> bool:
	return $derecha.is_colliding()
	
func _floor_detection() -> bool:
	return $AnimatedSprite2D/deteccionSuelo.is_colliding()
	
func _flip():
	if _next_to_left_wall() or _next_to_right_wall() or !_floor_detection():
		motion.x *= -1
		$AnimatedSprite2D.scale.x *= -1
	

func _process(delta):
	motion.y += GRAVITY
	_flip()
	
	motion = move_and_slide(motion)
	pass
