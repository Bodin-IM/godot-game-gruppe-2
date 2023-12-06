extends Node

var tre_ressurser= 0
var stein_ressurser = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func on_dead_tree(amount):
	tre_ressurser += amount
	print("treressurser =", tre_ressurser)
func on_dead_rock(amount):
	stein_ressurser += amount
	print("steinressurser =", stein_ressurser)
