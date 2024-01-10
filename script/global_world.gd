extends Node

var level = 0
#var wall_price = 2

var tree_attack = 1
var stone_attack = 1

signal remove_plot()
signal level_complete_canvas()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func level_complete():
	level += 1
#	wall_price += 1
	level_complete_canvas.emit()

	print("hurra, du vant")

func build_built():
	remove_plot.emit()


func reset():
	level_complete_canvas.emit()
	level = 0
