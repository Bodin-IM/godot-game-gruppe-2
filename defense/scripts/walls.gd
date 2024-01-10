extends Node2D

var hp = 25

var fenceHit = preload("res://audio/fenceHit.ogg")

func on_hit():
	hp -= 1
	SfxPlayer.play_sound(fenceHit, get_tree().current_scene)
	if hp <= 0:
		destroyed()

func destroyed():
	queue_free()
	print("Crumbled")
