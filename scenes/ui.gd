extends CanvasLayer

static var image = load("res://font/playerLife1_red.png")
var time_elapsed : int = 0

func set_health(amount):
	for child in $MarginContainer/HBoxContainer.get_children():
		child.queue_free()
	
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP


func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	#$MarginContainer/Label.text = str(time_elapsed)
	print(time_elapsed)
	$MarginContainer2/Label.text = str(time_elapsed)
	Global.score = time_elapsed;
