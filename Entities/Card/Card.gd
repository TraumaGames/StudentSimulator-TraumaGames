extends Sprite
class_name Card

signal close_card

onready var label: Label = $Text
onready var buttonAccept: Button = $Accept
onready var buttonCancel: Button = $Cancel
var stats_update_accept = {}
var stats_update_cancel = {}

func update_values(text, textAccept, textCancel, stats_accept, stats_cancel):
	label.text = text
	buttonAccept.text = textAccept
	buttonCancel.text = textCancel
	stats_update_accept = stats_accept
	stats_update_cancel = stats_cancel

func _on_Accept_pressed():
	self.hide()
	emit_signal("close_card", stats_update_accept)

func _on_Cancel_pressed():
	self.hide()
	emit_signal("close_card", stats_update_cancel)
