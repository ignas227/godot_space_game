extends CharacterBody2D

@export var speed: int = 650;
var can_shoot: bool = true;

signal laser(pos);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 500);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down");
	#print(direction)
	velocity = direction * speed;
	move_and_slide()
	
	if Input.is_action_just_pressed("space") and can_shoot == true:
		laser.emit($LaserStartPosition.global_position);
		can_shoot = false;
		$LaserTimer.start();
		$LaserSound.play();
	


func _on_laser_timer_timeout() -> void:
	can_shoot = true;
