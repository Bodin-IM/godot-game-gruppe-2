extends CharacterBody2D

@onready var vision_area = $VisionArea
@onready var attack_check_area = $AttackCheckArea
@onready var animated_sprite_2d = $AnimatedSprite2D

var movement_speed = 50
var shmoovin = false
var is_attacking = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	find_target()
	handle_movement(delta)
	
	move_and_slide()
	
	update_animation()


func find_target():
	# sjekker om den finner noen bygg, collision sjekker bare layeret som heter "bygg
	if vision_area.get_overlapping_areas():
	
		# gjør det første bygget i arrayet med bygg til en variabel
		var target_build = vision_area.get_overlapping_areas()[0].get_parent()
		look_at(target_build.position)
		print("BYGG")
	
	elif get_tree().get_first_node_in_group("main_build_group"):
		var main_build = get_tree().get_first_node_in_group("main_build_group")
		print("MAIN")
		look_at(main_build.position)
		
		
	
func handle_movement(delta):
	if attack_check_area.get_overlapping_areas():
		shmoovin = false
		is_attacking = true
	else:
		shmoovin = true
		position += transform.x * movement_speed * delta




func update_animation():
	if shmoovin:
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")



func _on_animated_sprite_2d_animation_finished():
	is_attacking = false
