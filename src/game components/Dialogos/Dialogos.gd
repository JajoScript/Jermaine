extends Node2D

@export var entityName = "";
@export var dialogList = [];

@onready var dialogSwitch = false;
@onready var dialogLabel = $"Label";
@onready var timer = $"Timer";
@onready var randomGenerator = RandomNumberGenerator.new();

#* -- Base
func _ready():
	dialogLabel.visible = false;
	
	# Definir cual sera el tiempo de spawn de los dialogos.
	var dialogSpawnTime = handle_spawn();
	timer.wait_time = dialogSpawnTime;
	


func _process(_delta):
	pass


#* -- Control de dialogos
func handle_spawn():
	var randomTime = randomGenerator.randf_range(1, 3)
	return randomTime;
	
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

