extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var nest = get_node("OrmNest")
	nest.get_stats(3, 40)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
