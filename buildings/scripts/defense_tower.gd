extends Node2D

var target = null
var attackRange = 200
var shooting_delay = 1.0  # Set the delay between shots
var damage_per_shot = 10

var time_since_last_shot = 0.0

func _process(delta):
	if target:
		rotate_towards_target(target.position)

		# Implement shooting logic
		time_since_last_shot += delta
		if time_since_last_shot >= shooting_delay:
			shoot()
			time_since_last_shot = 0.0

	# Check for enemies in range and set as target
	var enemies = get_tree().get_nodes_in_group("enemy_group")
	for enemy in enemies:
		var distance = position.distance_to(enemy.position)
		if distance < attackRange and not target:
			set_target(enemy)
			break

func rotate_towards_target(target_position):
	var angle = position.angle_to(target_position)
	rotation = angle

func shoot():
	# Implement damage logic
	if target:
		# Apply damage to the target
		target.take_damage(damage_per_shot)

		# Optionally, check if the target is destroyed and reset the target
		if target.is_dead():
			reset_target()

func set_target(new_target):
	target = new_target

func reset_target():
	target = null
