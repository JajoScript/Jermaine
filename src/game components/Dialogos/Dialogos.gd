extends Node2D

@export var entityName = "";
@export var dialogList = [];

@onready var dialogSwitch = false;
@onready var dialogLabel = $"Label";
@onready var randomGenerator = RandomNumberGenerator.new()

#* -- Base
func _ready():
	dialogLabel.visible = false;


func _process(_delta):
	pass


#* -- Control de dialogos
func handle_dialog():
	var limite = (dialogList.size() - 1);
	
	var index = 0;
	if (limite >= 0):
		index = randomGenerator.randi_range(0, limite);
	
		dialogLabel.visible = true;
		dialogLabel.text = dialogList[index];
	else:
		print("[*] No hay dialogos definidos!")


func _on_timer_timeout():
	if (dialogSwitch): handle_dialog();
	else: dialogLabel.visible = false;
	
	# Change.
	dialogSwitch = !dialogSwitch;

