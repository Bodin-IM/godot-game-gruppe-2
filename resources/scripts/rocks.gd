extends Area2D

var rng = RandomNumberGenerator.new()

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var rock_lives = 5
@onready var ressurser_stein = rng.randf_range(5, 10)
var current_frame = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (rock_lives == 5):
		animated_sprite_2d.play("rock")

func on_hit():
	print("hit")
	
	if (rock_lives > 0):
		rock_lives -= 1
		current_frame += 1
	elif (rock_lives < 1):
		dead_rock()
	
func dead_rock():
	Resources.on_dead_rock(ressurser_stein)
	animated_sprite_2d.frame=5
