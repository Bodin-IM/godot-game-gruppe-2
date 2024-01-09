extends Node2D

var hp = 100

func on_hit():
	hp -= 1
	if hp <= 0:
		destroyed()

func destroyed():
	get_parent().queue_free()
	print("Crumbled")
