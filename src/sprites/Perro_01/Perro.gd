extends Node2D

@onready var sprite = $"Sprite"
@onready var dialogSwitch = false;
@onready var dialogLabel = $"Dialogos/Label"
@onready var dialogList = [
	"Woof Woof"
]

#* -- Base.
func _ready():
	sprite.play("idle")
	$AnimationPlayer.play("walk")


func _process(_delta):
	pass


#* -- Talks.
func handle_dialog():
	dialogLabel.visible = true;
	dialogLabel.text = dialogList[0];


func _on_timer_timeout():
	if (dialogSwitch): handle_dialog();
	else: dialogLabel.visible = false;
	
	# Change.
	dialogSwitch = !dialogSwitch;
