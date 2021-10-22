extends Node
class_name CardInformation

var next_card_accept: CardInformation
var next_card_cancel: CardInformation
var text: String
var textAccept: String
var textCancel: String
var stats_accept: Dictionary = {}
var stats_cancel: Dictionary = {}

func initialize(text, textAccept, textCancel, statsAccept, statsCancel, card_accept: CardInformation=null, card_cancel: CardInformation=null):
	self.text = text
	self.textAccept = textAccept
	self.textCancel = textCancel
	self.stats_accept = statsAccept
	self.stats_cancel = statsCancel
	next_card_accept = card_accept
	next_card_cancel = card_cancel
