extends Area2D

var speed = 300

var orm_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)

func move(delta):
	position.x = move_toward(position.x, orm_pos.x, speed * delta)
	position.y = move_toward(position.y, orm_pos.y, speed * delta)
	
func look_towards(target):
	look_at(target)
	orm_pos = target
	print(target)
