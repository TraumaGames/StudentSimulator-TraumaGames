extends Node
class_name CardInformation

var parent
#var next_card_accept: CardInformation
#var next_card_cancel: CardInformation
export var text: String
export var textAccept: String
export var textCancel: String
export var stats_accept: Dictionary = {}
export var stats_cancel: Dictionary = {}
export var next_card_index_accept: int = 0
export var next_card_index_cancel: int = 0

func set_parent(parent):
	self.parent = parent

func initialize(text, textAccept, textCancel, statsAccept, statsCancel):#, card_accept: CardInformation=null, card_cancel: CardInformation=null):
	self.text = text
	self.textAccept = textAccept
	self.textCancel = textCancel
	self.stats_accept = statsAccept
	self.stats_cancel = statsCancel
#	next_card_accept = card_accept
#	next_card_cancel = card_cancel

func next_card_accept():
	return parent.cards[next_card_index_accept] if(next_card_index_accept >= 0) else null

func next_card_cancel():
	return parent.cards[next_card_index_cancel] if(next_card_index_cancel >= 0) else null
