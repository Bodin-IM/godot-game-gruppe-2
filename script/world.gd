extends Node2D

var level = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	level = GlobalWorld.level
	print(level)
	
	
	var nest = get_node("OrmNest") 
	nest.get_stats(3, 20 + (level * 5))

func _process(delta):
	if Input.is_key_pressed(KEY_N):
		next_level()


func next_level():
	# dette virker ikke, jeg tror det er fordi scenen allerede har blitt brukt eller noe sånt
	GlobalWorld.level_complete()
	
	get_tree().change_scene_to_file("res://scenes/world.tscn")
