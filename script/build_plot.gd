extends Area2D

var player_is_here = false

var build # skal jeg gjøre dette ti len array?

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_is_here:
		give_options()


func give_options():
	if Input.is_key_pressed(KEY_1):
		print("1!")
		build = preload("res://buildings/scenes/defense_tower.tscn")
		var new_build = build.instantiate()
		new_build.position = position
		get_tree().root.add_child(new_build)
		queue_free()


func _on_body_entered(body):
	player_is_here = true


func _on_body_exited(body):
	player_is_here = false
