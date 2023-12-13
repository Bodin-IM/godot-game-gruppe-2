extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var tre_ressurser = Resources.tre_ressurser
	var stein_ressurser = Resources.stein_ressurser
	$log_label.text = str(tre_ressurser)
	$rock_label.text = str(stein_ressurser)
	
	
