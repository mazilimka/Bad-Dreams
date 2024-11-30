extends Node2D


@onready var good_dream_scene := preload('res://Dreams/GoodDreams/good_dream.tscn')
@onready var bad_dream_scene := preload('res://Dreams/BadDreams/bad_dream.tscn')


func _ready() -> void:
	%TimerForGoodDreams.timeout.connect(_timer_for_good_dreams_timeout)
	%TimerForBadDreams.timeout.connect(_timer_for_bad_dreams_timeout)


func launch_dream(what_dream: PackedScene):
	var dream_instance: Area2D = what_dream.instantiate()
	add_child(dream_instance, true)
	dream_instance.global_position = Vector2(randf_range(10, 790), -10)


func _timer_for_good_dreams_timeout():
	%TimerForGoodDreams.wait_time = randf_range(0.3, 1.5)
	launch_dream(good_dream_scene)


func _timer_for_bad_dreams_timeout():
	%TimerForBadDreams.wait_time = randf_range(0.1, 1.0)
	launch_dream(bad_dream_scene)
