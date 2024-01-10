extends Node2D

var target = null
var attackRange = 200
var shooting_delay = 1.0  # Set the delay between shots
var damage_per_shot = 5

var time_since_last_shot = 0.0

var can_shoot = true

func _ready():
	$Timer.start()
	
func _process(_delta):
	if target:
		rotate_towards_target(target.position)
		# Implement shooting logic
		if can_shoot:
			print("shot")
			shoot()
			
	reset_target()
	# Check for enemies in range and set as target
	var enemies = get_tree().get_nodes_in_group("enemy_group")
	for enemy in enemies:
		var distance = global_position.distance_to(enemy.global_position)
		if distance < attackRange and not target:
			set_target(enemy)
			break

func rotate_towards_target(target_position):
	var angle = position.angle_to(target_position)
	rotation = angle

func shoot():
	# Implement damage logic
	print("traff orm")
	# Apply damage to the target
	target.on_hit()
	$Timer.start()
	can_shoot = false

	# Optionally, check if the target is destroyed and reset the target
	if target.death_check():
		reset_target()

func set_target(new_target):
	target = new_target

func reset_target():
	target = null


func _on_timer_timeout():
	print("timer timeout")
	can_shoot = true
