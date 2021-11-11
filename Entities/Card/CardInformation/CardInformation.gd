extends Node
class_name CardInformation

var parent
export var text: String
export var textAccept: String
export var textCancel: String
export var stats_accept: Dictionary = {}
export var stats_cancel: Dictionary = {}
export var next_card_index_accept: int = 0
export var next_card_index_cancel: int = 0

func set_parent(parent):
	self.parent = parent

func next_card_accept():
	return parent.cards[next_card_index_accept] if(next_card_index_accept >= 0) else null

func next_card_cancel():
	return parent.cards[next_card_index_cancel] if(next_card_index_cancel >= 0) else null
