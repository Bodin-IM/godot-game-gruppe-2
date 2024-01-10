extends CanvasLayer

func game_ending():
	$end_of_game_screen.visible= true

func _on_restart_button_pressed():
	pass
func _on_quit_button_pressed():
	print("hua")
	get_tree().quit()


func _on_quit_button_2_pressed():
	print("restart plis")
	$end_of_game_screen.visible= false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/world.tscn")
