extends Node2D
@onready var spawn_timer = $SpawnTimer

var spawn_delay = 1
var orm_hp = 10

var ORM1 = preload("res://scenes/orm.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_spawn_timer_timeout():
	var orm = ORM1.instantiate()
#	orm.position = Vector2(position.x + randi_range(-10, 10), position.y + randi_range(-5, 5))
	orm.hp = orm_hp
	
	add_child(orm)
	spawn_timer.start()
	
	if spawn_timer.time_left > 1:
		spawn_timer.wait_time -= spawn_timer.wait_time * 0.02


func get_stats(new_delay, new_orm_hp):
	spawn_timer = $SpawnTimer
	spawn_delay = new_delay
	spawn_timer.wait_time = spawn_delay
	orm_hp = new_orm_hp


