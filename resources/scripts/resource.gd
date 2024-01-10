extends Node

var tre_ressurser= 0
var stein_ressurser = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalWorld.level_complete_canvas.connect(reset_ressurs)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func on_dead_tree(amount):
	tre_ressurser += amount
	print("treressurser = ", tre_ressurser)
	
	
func on_dead_rock(amount):
	stein_ressurser += amount
	print("steinressurser = ", stein_ressurser)


func reset_ressurs():
	tre_ressurser = 0
	stein_ressurser = 0
