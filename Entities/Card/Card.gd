extends Control
class_name Card

signal close_card

onready var label: Label = $Text
onready var buttonAccept: Button = $CenterAccept/Accept
onready var buttonCancel: Button = $CenterCancel/Cancel
var card_information: CardInformation

func set_information(information: CardInformation):
	card_information = information
	if information != null:
		update_values(information.text, information.textAccept, information.textCancel)

func update_values(text, textAccept, textCancel):
	label.text = text
	buttonAccept.text = textAccept
	buttonCancel.text = textCancel

func _on_Accept_pressed():
	self.hide()
	var old_information = card_information
	set_information(card_information.next_card_accept({"tags": [], "stats": {}}))
	emit_signal("close_card", old_information.stats_accept)

func _on_Cancel_pressed():
	self.hide()
	var old_information = card_information
	set_information(card_information.next_card_cancel({"tags": [], "stats": {}}))
	emit_signal("close_card", old_information.stats_cancel)
