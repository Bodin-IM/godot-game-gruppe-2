extends Area2D

var speed = 300
var attack = 3

var orm_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)

func move(delta):
#	global_position.x = move_toward(global_position.x, orm_pos.x, speed * delta)
#	global_position.y = move_toward(global_position.y, orm_pos.y, speed * delta)
	global_position = global_position.move_toward(orm_pos, delta*speed)
	
	
	
func look_towards(target):
	print(target)
	look_at(target)
	orm_pos = target


func _on_body_entered(body):
	if body.is_in_group("enemy_group"):
		print("traff orm fra defense")
		body.on_hit(attack)
		queue_free()
