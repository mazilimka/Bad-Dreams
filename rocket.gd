extends Area2D

var speed := 1500.0
var direction = Vector2.RIGHT

func _ready() -> void:
	%VisibleOnScreenEnabler2D.screen_exited.connect(_rocket_screen_exited)


func _physics_process(delta: float) -> void:
	global_position += direction * speed * delta


func set_direction(_dir: Vector2):
	direction = _dir
	rotation = _dir.angle() + deg_to_rad(90.0)


func _rocket_screen_exited():
	queue_free()
