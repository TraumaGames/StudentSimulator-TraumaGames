extends Control

onready var barName: Label = $BarName
onready var bar: ProgressBar = $Bar
export var bar_name: String setget _set_bar_name, _get_bar_name
export var value: float setget _set_value, _get_value

func _ready():
	barName.text = bar_name
	bar.value = value

func _set_bar_name(new_name: String):
	bar_name = new_name
	if barName != null:
		barName.text = bar_name

func _get_bar_name():
	return bar_name

func _set_value(new_value: float):
	value = new_value
	if barName != null:
	  bar.value = value

func _get_value():
	return value
