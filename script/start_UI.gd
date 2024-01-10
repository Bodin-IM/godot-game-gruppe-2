extends CanvasLayer


func game_starting():
	$start_of_game_screen.visible = true
	get_tree().paused

func _on_start_button_pressed():
	$start_of_game_screen.visible = false	

func _on_quit_button_pressed():
	get_tree().quit()
