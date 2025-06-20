#extends Node2D
#
#var pipe_prefab = preload("res://pipe.tscn")
#var screen_axis : Vector2
#var offsetX : int
#var offsetY : int
#
#
#func _ready():
	#var screen_axis = get_viewport_rect().size
	#spawn_pipe()
	#
#func spawn_pipe():
	#var pipe = pipe_prefab.instantiate()
	#pipe.position.x = 150
	#add_child(pipe)
