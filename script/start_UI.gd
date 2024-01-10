extends CanvasLayer

var world = preload("res://scenes/world.tscn")


func game_starting():
	$start_of_game_screen.visible = true
	get_tree().paused

func _on_start_button_pressed():
	$start_of_game_screen.visible = false
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
