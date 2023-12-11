extends CharacterBody2D

@onready var vision_area = $VisionArea
@onready var attack_check_area = $AttackCheckArea
@onready var animated_sprite_2d = $AnimatedSprite2D

@onready var attack_area = $AttackArea
@onready var attack_shape = $AttackArea/CollisionShape2D

@onready var attack_timer = $AttackTimer

var movement_speed = 50
var shmoovin = false
var is_attacking = false

var hp = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	# fargen trenger ikke være tilfeldig, jeg gjorde bare dette for gøy
	animated_sprite_2d.modulate =Color(randi_range(0, 100) * 0.01, randi_range(0, 100) * 0.01, 1)

func _physics_process(delta):
	find_target(delta)
	apply_movement(delta)
	handle_attack()
	
	move_and_slide()
	
	update_animation()


func find_target(delta):
	# sjekker om den finner noen bygg, collision sjekker bare layeret som heter "bygg
	if vision_area.get_overlapping_areas():
	
		# gjør det første bygget i arrayet med bygg til en variabel
		var target_build = vision_area.get_overlapping_areas()[0].get_parent()
		
		
		smooth_look_at(target_build.position, delta)
		
	
	elif get_tree().get_first_node_in_group("main_build_group"):
		var main_build = get_tree().get_first_node_in_group("main_build_group")
		
		smooth_look_at(main_build.position, delta)


func smooth_look_at(target_pos, delta):
	# får ormen til å rotere smooth og kan brukes flere plasser
	var prerotation = rotation_degrees
	look_at(target_pos)
	prerotation = move_toward(prerotation, rotation_degrees, 300 * delta)
	rotation_degrees = prerotation

	
func apply_movement(delta):
	if attack_check_area.get_overlapping_areas():
		shmoovin = false
		if attack_timer.time_left <= 0:
			is_attacking = true
			
	else:
		shmoovin = true
		position += transform.x * movement_speed * delta


func handle_attack():
	if is_attacking and attack_timer.time_left <= 0:
		attack_area.position.x = 11
		attack_shape.disabled = false
		attack_timer.start()
#		queue_free()
		
	elif not is_attacking: # deaktiverer attack areaen
		attack_area.position.x = 0
		attack_shape.disabled = true


func update_animation():
	if is_attacking:
		animated_sprite_2d.play("attack")
	else:
		if shmoovin:
			animated_sprite_2d.play("walk")
		else:
			animated_sprite_2d.play("idle")



func _on_animated_sprite_2d_animation_finished():
	is_attacking = false


func _on_attack_area_area_entered(area):
	if area.is_in_group("build_group"):
		print("build attacked!")



func on_hit():
	hp -= 5
	death_check()

func death_check():
	
	if hp <= 0:
		print("ouch")
		queue_free()
