extends Node2D

@onready var progressbar = $Area2D/Sprite2D/ProgressBar 

var hp = 200
var max_hp = hp


func _ready():
	progressbar.max_value = max_hp

func _physics_process(delta):
	progressbar.value = hp
	
	if (hp > 120): 
		progressbar.modulate = "#00ff00"
	
	if (hp < 120):
		progressbar.modulate = "#ffff00"
		
	if (hp < 60):
		progressbar.modulate = "#de0000"
	
	
func on_hit():
	if (hp < 1):
		queue_free()
