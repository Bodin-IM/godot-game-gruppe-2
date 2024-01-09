extends Area2D

@onready var progressbar = $Sprite2D/ProgressBar

var label
var wood_price
var stone_price
var max_hp = 100
var what_build
var hp

var plot = preload("res://scenes/build_plot.tscn")

func _ready():
	hp = max_hp
	progressbar.max_value = max_hp

func _physics_process(delta):
	progressbar.value = hp
	
	if (hp > max_hp * 0.6): 
		progressbar.modulate = "#00ff00"
	
	if (hp < max_hp * 0.6):
		progressbar.modulate = "#ffff00"
		
	if (hp < max_hp * 0.3):
		progressbar.modulate = "#de0000"
	


func on_hit():
	hp -= 1
	if hp <= 0:
		call_deferred("destroyed")
	

func destroyed():
	if label:
		var new_plot = plot.instantiate()
		new_plot.global_position = global_position
		
		new_plot.label = label
		new_plot.wood_price = wood_price
		new_plot.stone_price = stone_price
		new_plot.hp = max_hp
		new_plot.what_build = what_build
		get_parent().get_parent().add_child(new_plot)
	get_parent().queue_free()
	print("Crumbled")


