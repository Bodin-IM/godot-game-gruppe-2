extends Node2D

var target = null
var attackRange = 200
var shooting_delay = 1.0  # Set the delay between shots
var damage_per_shot = 2

var time_since_last_shot = 0.0

var bullet = preload("res://defense/scenes/defence_bullet.tscn")

func _process(delta):
	if target != null:
#		rotate_towards_target(target.position)

		# Implement shooting logic
		time_since_last_shot += delta
		if time_since_last_shot >= shooting_delay:
			shoot()
			time_since_last_shot = 0.0

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
	var new_bullet = bullet.instantiate()
	new_bullet.look_towards(target.global_position)
	add_child(new_bullet)
	print(target.global_position)
#	# Implement damage logic
#	if target:
#		if target.is_dead():
#			reset_target()

func set_target(new_target):
	target = new_target

func reset_target():
	target = null
	print("dødd")
