extends CharacterBody2D

@export var g = 750
@export var h = 70
var score : int
#@export var slide_speed = 150
var screen_axis : Vector2

func jump():
	velocity.y = -sqrt(2 * g * h)
	set_rotation(-PI/4)

func _ready():
	jump()

func _physics_process(delta):
	$AnimatedSprite2D.play()
	velocity.y += g * delta
	if Input.is_action_just_pressed("jump"):
		jump()
	if(velocity.y >= 0):
			set_rotation(PI/4)
	var target_angle = atan2(velocity.y, 150)
	target_angle = clamp(target_angle, -PI/4, PI/2)
	rotation = target_angle	   
	move_and_slide()
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.name == "middle"):
		GlobalVars.score += 1
	elif(area.name == "down" or "up"):
		get_tree().change_scene_to_file("res://Scenes/Game_Over.tscn")
		#print("pipe")
