extends Control

@export var level_scene: PackedScene = load("res://scenes/level.tscn")

func _ready():
	$CenterContainer/VBoxContainer/Label2.text += str(Global.score);

func _process(delta):
	if Input.is_action_just_pressed("space"):
		get_tree().change_scene_to_packed(level_scene)
