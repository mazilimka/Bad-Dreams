extends Area2D

@onready var block_timer: Timer = %BlockTimer

var speed := 150.0
var direction := Vector2.RIGHT
#var block_timer := 1.0
#var timer := 0.0
var _is_colliding := false

func _ready() -> void:
	area_entered.connect(_area_entered)
	block_timer.timeout.connect(_block_timer_timeout) 


func _process(delta: float) -> void:
	speed = randf_range(50.0, 400.0)
	global_position += direction * speed * delta
	
	if $RayCastLeft.is_colliding() or $RayCastRight.is_colliding() and not _is_colliding:
		if _is_colliding == true:
			return
		_is_colliding = true
		if direction == Vector2.RIGHT:
			direction = Vector2.LEFT
		elif direction == Vector2.LEFT:
			direction = Vector2.RIGHT
		block_timer.start(1.0)


func _block_timer_timeout():
	_is_colliding = false


func _area_entered():
	pass
