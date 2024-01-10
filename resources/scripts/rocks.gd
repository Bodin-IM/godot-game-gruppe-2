extends Area2D

var rng = RandomNumberGenerator.new()

@onready var respawn_timer = $RespawnTimer
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var rock_lives = 4
@onready var ressurser_stein = rng.randi_range(5, 10)
@onready var damage_taken = 1
var current_frame = 0

var hit_sfx = preload("res://audio/rockHit.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if (rock_lives == 5):
	pass

func on_hit():
	print("hit")
	
	if (rock_lives > 0):
		SfxPlayer.play_sound(hit_sfx, get_tree().current_scene)
		var rock_upgrade = get_tree().get_nodes_in_group("rock_upgrader").size()
		if rock_upgrade > 0:
			damage_taken = 2
		
		rock_lives -= damage_taken
		current_frame += 1
		update_animation()
	elif (rock_lives < 1):
		dead_rock()
		
func update_animation():
	animated_sprite_2d.frame = current_frame
	
func dead_rock():
	if (animated_sprite_2d.frame < 5):
		SfxPlayer.play_sound(hit_sfx, get_tree().current_scene)		
		Resources.on_dead_rock(ressurser_stein)
		animated_sprite_2d.frame=5
		respawn_timer.start()


func _on_respawn_timer_timeout():
	var new_tree = load("res://resources/scenes/rocks.tscn").instantiate()
	new_tree.position = position
	get_parent().add_child(new_tree)
	queue_free()
