extends Node2D


@onready var progress_bar = $Area2D/ridder_krabbe_hytte/ProgressBar

var hp = 50
var max_hp = hp

func _ready():
	progress_bar.max_value = max_hp

func _physics_process(delta):
	progress_bar.value = hp
	
	if (hp > 30): 
		progress_bar.modulate = "#00ff00"
	
	if (hp < 30):
		progress_bar.modulate = "#ffff00"
		
	if (hp < 15):
		progress_bar.modulate = "#de0000"
	
	
