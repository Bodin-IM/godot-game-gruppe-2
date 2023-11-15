extends CharacterBody2D


const SPEED = 300.0
@onready var animated_sprite_2d = $AnimatedSprite2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	apply_movement(delta, direction)

	move_and_slide()
	
	play_animation(direction)


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


func play_animation(direction):
	if direction:
		pass
