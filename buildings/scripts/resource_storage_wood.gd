extends Node2D

var max_hp : int = 100
var current_hp : int = max_hp

func update_hp_bar():
	var hp_percentage : float = current_hp / max_hp
	$ColorRect.rect_size.x = $Sprite.texture.get_width() * hp_percentage
