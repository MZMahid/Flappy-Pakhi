extends Node2D

func _process(delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file("res://Scenes/world.tscn")
