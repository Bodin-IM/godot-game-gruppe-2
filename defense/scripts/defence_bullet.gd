extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D

@export var speed = 300
var attack = 3

var orm_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	look_at(orm_pos)
	animated_sprite_2d.play("chomp")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	

func move(delta):
#	global_position.x = move_toward(global_position.x, orm_pos.x, speed * delta)
#	global_position.y = move_toward(global_position.y, orm_pos.y, speed * delta)
	position += transform.x * speed * delta



	# gjør at den spinner, veldig kult
#	look_at(orm_pos)
#	position += transform.y * speed * delta
	
	
	
	
func look_towards(target):
	print("target")
	orm_pos = target
	look_at(orm_pos)


func _on_body_entered(body):
	if body.is_in_group("enemy_group"):
		print("traff orm fra defense")
		body.on_hit(attack)
		queue_free()


func _on_timer_timeout():
	# gjør at den ikke eksisterer for alltid
	queue_free()
