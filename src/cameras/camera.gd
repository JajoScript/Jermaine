extends Camera2D
#@onready var player = get_node("/root/Mundo/Jermaine");
@onready var player = get_node("")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x = player.position.x;
	
	
	
