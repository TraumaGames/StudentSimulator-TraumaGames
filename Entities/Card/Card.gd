extends Control
class_name Card

signal close_card(stats_select)

onready var label: Label = $Text
onready var buttonAccept: TextureButton = $CenterAccept/Accept
onready var buttonCancel: TextureButton = $CenterCancel/Cancel
onready var animation_player: AnimationPlayer = $AnimationPlayer
var card_information

func set_information(information):
	card_information = information
	if information != null:
		update_values(information.text, information.textAccept, information.textCancel)

func show_card():
	animation_player.stop()
	show()
	animation_player.play("show")

func update_values(text, textAccept, textCancel):
	label.text = text
	buttonAccept.text = textAccept
	buttonCancel.text = textCancel

func random_int(Min, Max):
	var value = randi() % (Max - Min + 1) + Min
	return value
	
func assoc(value:int):
	return {3:value}

func _on_Accept_pressed():
	card_information.accept()
	_on_select(assoc(random_int(card_information.rand_min_bad,card_information.stats_accept[3])))

func _on_Cancel_pressed():
	card_information.cancel()
	_on_select(assoc(random_int(card_information.rand_min_study,card_information.stats_cancel[3])))

func _on_select(stats_select):
	self.hide()
	rect_scale = Vector2(0, 0)
	emit_signal("close_card", stats_select)

func set_next_information(state):
	var old_information = card_information
	set_information(card_information.next_card(state))
	old_information.reset()
	
func get_type():
	return CardManager.BINARY_CARD
