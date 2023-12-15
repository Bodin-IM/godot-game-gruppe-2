extends Node2D

var level = 0

var build_plots = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	level = GlobalWorld.level
	print(level)
	
	build_plots = get_tree().get_nodes_in_group("build_plot").size()
	print(build_plots)
	GlobalWorld.remove_plot.connect(progressing)
	

	
	var nest = get_node("OrmNest") 
	nest.get_stats(7, 20 + (level * 5))

func _process(delta):
	if Input.is_key_pressed(KEY_N):
		next_level()



func next_level():
	# dette virker ikke, jeg tror det er fordi scenen allerede har blitt brukt eller noe sånt
	GlobalWorld.level_complete()
	
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func progressing():
	build_plots = get_tree().get_nodes_in_group("build_plot").size()
	print(build_plots)
	if build_plots <= 1:
		print("Oooo")
		next_level()
