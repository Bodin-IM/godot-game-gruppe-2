extends Node2D

var hp = 25

func on_hit():
	hp -= 1
	if hp <= 0:
		destroyed()

func destroyed():
	queue_free()
	print("Crumbled")
