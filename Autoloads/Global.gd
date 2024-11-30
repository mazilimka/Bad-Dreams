extends Node

var mistakes := 4


func global_restart():
	get_tree().reload_current_scene()
	get_tree().paused = false
	mistakes = 4
	Hud.set_text(mistakes)
