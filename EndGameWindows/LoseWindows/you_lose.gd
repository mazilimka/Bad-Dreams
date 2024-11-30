extends PanelContainer


func _ready() -> void:
	%RestartGame.pressed.connect(_restart_game_pressed)
	%Quit.pressed.connect(_quit_pressed)


func _restart_game_pressed():
	Global.global_restart()
	hide()


func _quit_pressed():
	get_tree().quit()
	hide()
