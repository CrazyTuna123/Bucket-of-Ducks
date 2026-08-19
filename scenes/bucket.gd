extends CharacterBody2D

func _process(_delta):
	position.x = get_global_mouse_position().x

func _on_area_entered(area):
	if area.is_in_group("ducks"):
		get_tree().current_scene.caught_duck()
		area.queue_free()
