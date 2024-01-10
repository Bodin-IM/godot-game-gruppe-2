extends CanvasLayer

func game_ending():
	$end_of_game_screen.visible= true

func _on_restart_button_pressed():
	$end_of_game_screen.visible= false	

func _on_quit_button_pressed():
	get_tree().quit()
