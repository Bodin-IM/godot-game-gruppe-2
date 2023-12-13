extends Area2D


var defense_tower = preload("res://buildings/scenes/defense_tower.tscn")
var ridder_hytte = preload("res://buildings/scenes/ridder_krabber_hytte.tscn")
var storage_wood = preload("res://buildings/scenes/resource_storage_wood.tscn")
var storage_stone = preload("res://buildings/scenes/resource_storage_stone.tscn")

# var builds = [defense_tower, ridder_hytte, storage_wood, storage_stone] # trenger jeg denne?




@onready var control = $Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func lets_build_it(build):
	var new_build = build.instantiate()
	new_build.position = position
	get_parent().add_child(new_build)
	queue_free()

func _on_body_entered(body):
	control.visible = true
func _on_body_exited(body):
	control.visible = false




func _on_button_pressed():
	lets_build_it(defense_tower)

func _on_button_2_pressed():
	lets_build_it(ridder_hytte)

func _on_button_3_pressed():
	lets_build_it(storage_wood)

func _on_button_4_pressed():
	lets_build_it(storage_stone)
