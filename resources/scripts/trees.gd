extends Area2D

var rng = RandomNumberGenerator.new()

@onready var animations = $AnimationPlayer
@onready var stubbe = $Stubbe
@onready var tre = $Tree
@onready var tree_lives = 5
@onready var ressurser_tre = rng.randi_range(5, 10)

var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
	
func on_hit():
	if (dead == false):
		tree_lives -= 1
		animations.play("tree_animation")
		if (tree_lives < 1):
			dead_tree()
	
func dead_tree():
	Resources.on_dead_tree(ressurser_tre) 
	dead = true
	stubbe.visible = true
	tre.visible = false
	
	
	
	
