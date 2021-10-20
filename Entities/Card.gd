extends Sprite

signal update_values

onready var label: Label = $Text
onready var buttonAccept: Button = $Accept
onready var buttonCancel: Button = $Cancel
var stats_update_accept = {}
var stats_update_cancel = {}
var player: Player

func initialize(player: Player):
	self.player = player

func _update_values(text, textAccept, textCancel, stats_accept, stats_cancel):
	label.text = text
	buttonAccept.text = textAccept
	buttonCancel.text = textCancel
	stats_update_accept = stats_accept
	stats_update_cancel = stats_cancel

func _on_Card_update_values(text, textAccept, textCancel, stats_accept, stats_cancel):
	 _update_values(text, textAccept, textCancel, stats_accept, stats_cancel)

func _on_Accept_pressed():
	self.hide()
	player.emit_signal("update_stats", stats_update_accept)

func _on_Cancel_pressed():
	self.hide()
	player.emit_signal("update_stats", stats_update_cancel)
