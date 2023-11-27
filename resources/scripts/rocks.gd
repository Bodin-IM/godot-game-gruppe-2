extends Area2D

var rng = RandomNumberGenerator.new()

@onready var rock_lives = 5
@onready var ressurser_stein = rng.randf_range(5, 10)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_hit():
	rock_lives -= 1
	if (rock_lives < 1):
		dead_tree()
	
func dead_tree():
	Resources.on_dead_rock(ressurser_stein)
	queue_free()
	