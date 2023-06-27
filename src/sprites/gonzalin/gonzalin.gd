extends CharacterBody2D

@onready var DialogLabel = $"Dialog/Label"
@onready var DialogContainer = $"Dialog"
@onready var switch = false;

var dialogos = [
	"Completos 2 x $1000",
	"Los mejores completos de Rancagua",
	"Que ganas de comer empanadas..."
]
var randomGenerator = RandomNumberGenerator.new()

# Base
func _ready():
	DialogLabel.visible = false;
	DialogContainer.visible = true;

func _process(_delta):
	animate();
	
func animate():
	$Sprite.play("Idle")
	
# Control de dialogos.
func controlDialogs():
	var index = randomGenerator.randi_range(0, 2)
	DialogLabel.text = dialogos[index]

# Mostrando y ocultando los dialogos
func _on_timer_timeout():
	if (switch):
		DialogLabel.visible = true;
		controlDialogs();
	else:
		DialogLabel.visible = false;
		
	switch = !switch
