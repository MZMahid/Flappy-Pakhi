extends Node2D

	
func _physics_process(delta: float) -> void:
	position.x -= GlobalVars.scrolling_speed * delta
