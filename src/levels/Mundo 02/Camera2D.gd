extends Camera2D
@onready var player = get_node("/root/Mundo_02/Jermaine");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# position.y = player.position.y;
	position.x = player.position.x;
