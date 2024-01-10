extends Area2D

@onready var button = $Control/Button

@export var label = "Bygg"
@export var wood_price: int
@export var stone_price: int
@export var hp: int


#var defense_tower = preload("res://buildings/scenes/defense_tower.tscn")
#var ridder_hytte = preload("res://buildings/scenes/ridder_krabber_hytte.tscn")
#var storage_wood = preload("res://buildings/scenes/resource_storage_wood.tscn")
#var storage_stone = preload("res://buildings/scenes/resource_storage_stone.tscn")

@export var what_build: PackedScene

# var builds = [defense_tower, ridder_hytte, storage_wood, storage_stone] # trenger jeg denne?




@onready var control = $Control

var bygg_sfx = preload("res://audio/byggBygg.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	button.text = "Build " + label + "
	Wood: " + str(wood_price) + "
	Stone " + str(stone_price)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func lets_build_it():
	print(Resources.tre_ressurser, ", ", Resources.stein_ressurser)
	if what_build and Resources.tre_ressurser >= wood_price and Resources.stein_ressurser >= stone_price:
		SfxPlayer.play_sound(bygg_sfx, get_tree().current_scene)
		var new_build = what_build.instantiate()
		
		new_build.position = position
		new_build.get_child(0).label = label
		new_build.get_child(0).wood_price = wood_price
		new_build.get_child(0).stone_price = stone_price
		new_build.get_child(0).max_hp = hp
		new_build.get_child(0).what_build = what_build
		
		
		get_parent().add_child(new_build)
		queue_free()
		Resources.tre_ressurser -= wood_price
		Resources.stein_ressurser -= stone_price
		
		GlobalWorld.build_built()
	

func _on_body_entered(body):
	control.visible = true
func _on_body_exited(body):
	control.visible = false




func _on_button_pressed():
	lets_build_it()
