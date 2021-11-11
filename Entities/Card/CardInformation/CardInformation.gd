extends Node
class_name CardInformation

var next_card_accept: CardInformation
var next_card_cancel: CardInformation
export var text: String
export var textAccept: String
export var textCancel: String
export var stats_accept: Dictionary = {}
export var stats_cancel: Dictionary = {}
export var next_card_index_accept: int = 0
export var next_card_index_cancel: int = 0

func initialize(text, textAccept, textCancel, statsAccept, statsCancel, card_accept: CardInformation=null, card_cancel: CardInformation=null):
	self.text = text
	self.textAccept = textAccept
	self.textCancel = textCancel
	self.stats_accept = statsAccept
	self.stats_cancel = statsCancel
	next_card_accept = card_accept
	next_card_cancel = card_cancel
