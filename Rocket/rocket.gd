extends Area2D

var speed := 1500.0
var direction := 0.0

func _ready() -> void:
	area_entered.connect(_collided_with_dream)
	%VisibleOnScreenEnabler2D.screen_exited.connect(_rocket_screen_exited)


func _physics_process(delta: float) -> void:
	global_position.x += direction * speed * delta


func set_direction(_dir: float):
	direction = _dir
	if _dir == 1:
		rotation_degrees = 90.0
	else:
		rotation_degrees = -90.0
		


func _collided_with_dream(_area: Area2D):
	if _area.is_in_group('Dreams'):
		_area.queue_free()
		queue_free()


func _rocket_screen_exited():
	queue_free()
