extends RichTextLabel

@onready var retry_button = $"../Button"
var pressed : bool

func _ready() -> void:
	self.text = "[b][color=#000000][font_size=64]{score}[/font_size][/color][/b]".format({"score": GlobalVars.score})


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		#GlobalVars.score = 0
		#get_tree().change_scene_to_file("res://world.tscn")
		pass

func _on_button_pressed() -> void:
	GlobalVars.score = 0
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
