extends Area2D

var tree_lives = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
	
func on_hit():
	tree_lives -= 1
	if (tree_lives < 1):
		dead_tree()
	
func dead_tree():
	queue_free()
