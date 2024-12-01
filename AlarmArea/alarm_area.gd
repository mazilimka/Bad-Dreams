extends Area2D


func _ready() -> void:
	area_entered.connect(_character_enter)


func _character_enter(_area: Area2D):
	if _area.is_in_group('Character'):
		_area.global_position.x = 400.0
		_area.block_timer_timeout()
