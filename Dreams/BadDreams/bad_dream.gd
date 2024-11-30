extends Area2D

var speed_of_fall := -350.0


func _ready() -> void:
	body_entered.connect(_entered_in_player)
	area_entered.connect(_entered_in_character)


func _process(delta: float) -> void:
	global_position.y -= speed_of_fall * delta


func set_mistakes():
	Global.mistakes += 1
	Hud.set_text(Global.mistakes)
	if Global.mistakes == 10:
		get_tree().paused = true
		Hud.you_lose.show()


func _entered_in_player(_body: Node2D):
	if _body.is_in_group('Player'):
		queue_free()


func _entered_in_character(_area: Area2D):
	if _area.is_in_group('Character'):
		set_mistakes()
		_area.character_increasing()
		queue_free()
