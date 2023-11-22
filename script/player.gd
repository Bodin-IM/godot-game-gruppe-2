extends CharacterBody2D


const SPEED = 100.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var attack_area = $Area2D
@onready var attack_shape = $Area2D/CollisionShape2D

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
	# Get the input direction and handle the movement/deceleration.
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
		if animated_sprite_2d.flip_h:
			attack_area.position.x = -10.667
			attack_area.position.y = 0
		elif not moving_vertical:
			attack_area.position.x = 10.667
			attack_area.position.y = 0
		elif vertical_direction:
			attack_area.position.y = -6
			attack_area.position.x = 0
		else:
			attack_area.position.y = 6
			attack_area.position.x = 0
			
			
		attack_shape.disabled = false
		
	else:
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
		if direction:
			animated_sprite_2d.play("walk")
			animated_sprite_2d.flip_h = (direction.x < 0)
			moving_vertical = (direction.y != 0)
			vertical_direction = (direction.y < 0)
		elif Input.is_action_pressed("block"):
			animated_sprite_2d.play("block?")
			
			
		else:
			animated_sprite_2d.play("idle")
	


func _on_animated_sprite_2d_animation_finished():
	is_attacking = false
