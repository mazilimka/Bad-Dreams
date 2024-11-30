extends CanvasLayer

@onready var mistakes: Label = %Mistakes
@onready var you_win: PanelContainer = $YouWin
@onready var you_lose: PanelContainer = $YouLose


func _ready() -> void:
	%Mistakes.text = 'Mistakes: 4 / 10'


func set_text(_mistake: int):
	%Mistakes.text = 'Mistakes: {mist} / 10'.format({'mist': _mistake})


func show_window(what_window: PanelContainer):
	what_window.show()
