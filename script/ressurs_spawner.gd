extends Node2D

var tree_scene = preload("res://resources/scenes/trees.tscn")
var stone_scene = preload("res://resources/scenes/rocks.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
#	var ressurser = get_tree().get_nodes_in_group("ressurs_object")
#	var spawner = get_tree().get_nodes_in_group("ressurs_spawner")
#	var total = ressurser.size() + spawner.size()
#
#	var trees = get_tree().get_nodes_in_group("tree_group")
#	var stones = get_tree().get_nodes_in_group("stone_group")
#
#	print(spawner.size(), " ", trees.size())
#
#	if stones.size() >= total * 0.5:
#		lets_place_it(tree_scene)
#		return
#	elif trees.size() >= total * 0.5:
#		lets_place_it(stone_scene)
#		return
#
	var rand = randi_range(0, 1)
	if rand == 0:
		lets_place_it(tree_scene)
	else:
		lets_place_it(stone_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func lets_place_it(ressurs):
	var new_ressurs = ressurs.instantiate()
	new_ressurs.position = position
	get_tree().root.add_child.call_deferred(new_ressurs)
	queue_free()
