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
export var upper_stats: Dictionary = {}
export var lower_stats: Dictionary = {}
export var tags: Array = []


func set_parent(parent):
	self.parent = parent

func next_card_accept(state):
	return parent.cards[next_card_index_accept] if(next_card_index_accept >= 0) else null

func next_card_cancel(state):
	return parent.cards[next_card_index_cancel] if(next_card_index_cancel >= 0) else null
	
func contains_tags(tags: Array):
	var contains = true
	for tag in tags:
		contains = contains && tag in self.tags
	return contains

func verify_stats(stats: Dictionary):
	return _verify_compare_stats(stats, upper_stats) && _verify_compare_stats(stats, lower_stats, false)

func _verify_compare_stats(stats, compare_stats, upper=true):
	var verify = true
	for stat in compare_stats.keys():
		verify = verify && (stats[stat] > compare_stats[stat] if upper else stats[stat] < compare_stats[stat])
	return verify
