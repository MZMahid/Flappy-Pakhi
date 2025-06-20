extends Node2D

var screen_axis : Vector2
var player_scene = preload("res://Scenes/player.tscn") 
var pipe_scene = preload("res://Scenes/pipe.tscn")
var player

@onready var spawner = $spawner
@onready var destryer = $destroyer

func _ready() -> void:
	screen_axis = get_viewport_rect().size
	spawner.position = Vector2(screen_axis.x + 500, screen_axis.y/2)
	destryer.position = Vector2(-150, screen_axis.y/2)
	spawn_player()
	spawn_pipe()

func spawn_player():
	player = player_scene.instantiate()
	player.position = screen_axis / 2
	add_child(player)

func spawn_pipe():
	var pipe = pipe_scene.instantiate()
	add_child(pipe)

func _physics_process(_float) -> void:
	#$RichTextLabel.text = str(GlobalVars.score)
	$CanvasLayer/RichTextLabel.text = "[b][color=#000000][font_size=64]{score}[/font_size][/color][/b]".format({"score": GlobalVars.score})
	if((player.position.y >= screen_axis.y) or (player.position.y <= 0)):
		get_tree().change_scene_to_file("res://Scenes/Game_Over.tscn")
		#print("top and bottom")
	

func _on_destroyer_area_entered(area: Area2D) -> void:
	var offsetY = randf_range(screen_axis.y / 2 - 100, screen_axis.y / 2 + 100)
	#var offsetX = randf_range(-50, 50)
	var pipe_node = area.get_parent().get_parent()
	pipe_node.global_position.x = $spawner.global_position.x
	pipe_node.global_position.y = offsetY
