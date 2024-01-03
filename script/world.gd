extends Node2D

var level = 0
var build_plots = 0

var new_nest = preload("res://scenes/orm_nest.tscn")
var fence_horizontal = preload("res://defense/scenes/wall_left_right.tscn")
var fence_vertical = preload("res://defense/scenes/wall_up_down.tscn")

var visible_fence = false

@onready var nest_timer = $NestTimer
@onready var pre_horizontal_wall = $PreHorizontalWall
@onready var pre_vertical_wall = $PreVerticalWall


# Called when the node enters the scene tree for the first time.
func _ready():
	level = GlobalWorld.level
	print(level)
	
	build_plots = get_tree().get_nodes_in_group("build_plot").size()
	print(build_plots)
	GlobalWorld.remove_plot.connect(progressing)
	
	nest_timer.wait_time -= level * 10
	

	
	var nest = get_node("OrmNest") 
	nest.get_stats(7, 20 + (level * 5))

func _process(delta):
	if Input.is_action_just_pressed("fence place"):
		place_fence()
	if Input.is_action_just_pressed("fence switch"):
		visible_fence = true
	if visible_fence:
		show_fence()
	if Input.is_key_pressed(KEY_N):
		next_level()


func place_fence():
	var mus_pos = get_global_mouse_position()
	var crab = get_tree().get_nodes_in_group("PlayerGroup")[0]
	var spawn_fence
	
	if abs(crab.position.x - mus_pos.x) < abs(crab.position.y - mus_pos.y):
		spawn_fence = fence_horizontal.instantiate()
	else:
		spawn_fence = fence_vertical.instantiate()
		
	spawn_fence.position = mus_pos
	add_child(spawn_fence)
	

func show_fence():
	var mus_pos = get_global_mouse_position()
	var crab = get_tree().get_nodes_in_group("PlayerGroup")[0]
	
	
	if abs(crab.position.x - mus_pos.x) < abs(crab.position.y - mus_pos.y):
		pre_horizontal_wall.position = mus_pos
		pre_vertical_wall.position = Vector2(1129, 0)
	else:
		pre_vertical_wall.position = mus_pos
		pre_horizontal_wall.position = Vector2(1129, 0)
	


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


func _on_nest_timer_timeout():
	var spawn_nest = new_nest.instantiate()
	spawn_nest.position.y = -576
	spawn_nest.get_stats(7, 20 + (level * 5))
	add_child(spawn_nest)
