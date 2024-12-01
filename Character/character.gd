extends Area2D

@onready var block_timer: Timer = %BlockTimer

var speed := 2800.0
var direction := Vector2.RIGHT
var _is_colliding := false

func _ready() -> void:
	block_timer.timeout.connect(block_timer_timeout) 


func _process(delta: float) -> void:
	#speed = randf_range(50.0, 400.0)
	global_position += direction * speed * delta
	
	if $RayCastLeft.is_colliding() or $RayCastRight.is_colliding() and not _is_colliding:
		if _is_colliding == true:
			return
		_is_colliding = true
		if direction == Vector2.RIGHT:   
			direction = Vector2.LEFT
		else:
			direction = Vector2.RIGHT
		block_timer.start(0.1)


func block_timer_timeout():
	_is_colliding = false


func character_decreasing():
	scale -= Vector2(0.05, 0.05)
	global_position.y += 7.0
	if speed != 2800:
		speed += 20
		print(speed)
	else:
		speed == 2800
		print(speed)


func character_increasing():
	scale += Vector2(0.05, 0.05)
	global_position.y -= 7.0
	if speed != 2800:
		print(speed)
		speed += 20
	else:
		print(speed)
		speed == 2800
