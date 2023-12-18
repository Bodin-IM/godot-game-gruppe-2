extends Node2D

var target = null
var range = 200  # Set the range of the tower
var targets = []  # List to store multiple targets
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target:
		var closest_target = get_closest_target()
		rotate_towards_target(target.position)
		# Implement shooting logic here
		# You may want to instantiate projectiles or deal damage to the target
		# Check for enemies in range and set as target
		var enemies = get_tree().get_nodes_in_group("enemies")  # Assuming enemies are in a group
		for enemy in enemies:
			var distance = position.distance_to(enemy.position)
			if distance < range and not target:
				set_target(enemy)
				break
# Function to set the target for the tower
func set_target(new_target):
	target = new_target
	targets.append(new_target)

# Function to get the closest target
func get_closest_target():
	var closest_distance = float('inf')
	var closest_target = null

	for target in targets:
		var distance = position.distance_to(target.position)
		if distance < closest_distance:
			closest_distance = distance
			closest_target = target

	return closest_target

func rotate_towards_target(target_position):
	var angle = position.angle_to(target_position)
	rotation = angle

   
