extends Control
class_name Card

signal close_card(stats_select)

onready var label: Label = $Text
onready var buttonAccept: Button = $CenterAccept/Accept
onready var buttonCancel: Button = $CenterCancel/Cancel
var card_information

func set_information(information):
	card_information = information
	if information != null:
		update_values(information.text, information.textAccept, information.textCancel)

func update_values(text, textAccept, textCancel):
	label.text = text
	buttonAccept.text = textAccept
	buttonCancel.text = textCancel

func _on_Accept_pressed():
	card_information.accept()
	_on_select(card_information.stats_accept)

func _on_Cancel_pressed():
	card_information.cancel()
	_on_select(card_information.stats_cancel)

func _on_select(stats_select):
	self.hide()
	emit_signal("close_card", stats_select)

func set_next_information(state):
	var old_information = card_information
	set_information(card_information.next_card(state))
	old_information.reset()
	
func get_type():
	return CardManager.BINARY_CARD
