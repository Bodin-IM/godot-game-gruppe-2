extends Node

var level = 0

signal remove_plot()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func level_complete():
	level += 1
	print("hurra, du vant")

func build_built():
	remove_plot.emit()
