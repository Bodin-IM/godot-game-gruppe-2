extends CharacterBody2D


const SPEED = 100.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var attack_area = $AttackArea
@onready var attack_shape = $AttackArea/CollisionShape2D

var is_attacking = false
var moving_vertical = false
var vertical_direction = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var input_axis_x = Input.get_axis("left", "right")
	var input_axis_y = Input.get_axis("up", "down")
	if Input.is_action_just_pressed("attack"):
		is_attacking = true
	var direction = Vector2(input_axis_x, input_axis_y)
	apply_movement(delta, direction)
	
	
	handle_attack(direction)

	move_and_slide()
	
	update_animation(direction, is_attacking)


func apply_movement(delta, direction):
	if direction.x:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction.y:
		velocity.y = direction.y * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)


func handle_attack(direction):
	if is_attacking:
		# finner retningen man attacker
		if not moving_vertical:
			if animated_sprite_2d.flip_h:
				attack_area.position.x = -10.667
				attack_area.position.y = 0
			else:
				attack_area.position.x = 10.667
				attack_area.position.y = 0
		elif vertical_direction:
			attack_area.position.y = -6
			attack_area.position.x = 0
		else:
			attack_area.position.y = 6
			attack_area.position.x = 0
		attack_shape.disabled = false
	else: # deaktiverer attack areaen
		attack_area.position.x = 0
		attack_area.position.y = 0
		attack_shape.disabled = true




func update_animation(direction, is_attacking):
	if is_attacking:
		if not moving_vertical:
			animated_sprite_2d.play("attack")
		elif vertical_direction:
			animated_sprite_2d.play("attack_up")
		else:
			animated_sprite_2d.play("attack_down")
	else:
		if direction.x:
			animated_sprite_2d.play("walk")
			animated_sprite_2d.flip_h = (direction.x < 0)
			moving_vertical = (direction.y != 0) # brukes for attack retning
			vertical_direction = (direction.y < 0)
			
		elif direction.y:
			animated_sprite_2d.play("walk_up")
			if direction.y > 0:
				animated_sprite_2d.play_backwards("walk_up")
			moving_vertical = (direction.y != 0) # brukes for attack retning
			vertical_direction = (direction.y < 0)
			
		else:
			animated_sprite_2d.play("idle")
	


func _on_animated_sprite_2d_animation_finished():
	is_attacking = false


func _on_attack_area_area_entered(area):
	if area.is_in_group("ressurs_object"):
		print("traff ressurs object")
		area.on_hit()

func _on_attack_area_body_entered(body):
	if body.is_in_group("enemy_group"):
		print("traff orm")
		body.on_hit()

