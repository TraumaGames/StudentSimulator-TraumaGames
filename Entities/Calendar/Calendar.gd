extends TextureButton
class_name Calendar

onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var crosses: Array = $Crosses.get_children()
var opened: bool = false
export var initial_date: int = 1 
var current_day: int = 1 setget set_day

func _ready():
	reset()
	_show_crosses(current_day)

func set_day(day: int):
	current_day = day
	if crosses != null:
		_show_crosses(day)

func _show_crosses(day: int):
	for cross in range(day - 1):
		crosses[cross].show()

func set_next_day():
	set_day(current_day + 1)

func reset():
	for cross in crosses:
		cross.hide()
	set_day(initial_date)

func _on_Calendar_pressed():
	if opened:
		animation_player.play_backwards("open")
		opened = false
	else:
		animation_player.play("open")
		opened = true
