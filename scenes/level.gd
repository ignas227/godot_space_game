extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn");

var health: int = 3

func _ready():
	get_tree().call_group('ui', 'set_health', health)

func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)
	
	meteor.connect('collision', _on_meteor_collision);
	

func _on_meteor_collision():
	health += -1
	$HealthLossSound.play();
	get_tree().call_group('ui', 'set_health', health)
	if health <= 0:
		print("ur dead nigga")
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate();
	$Lasers.add_child(laser);
	laser.position = pos;
