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
export var rand_min_study: int
export var rand_min_bad: int

var next_card_index = -1

func random_int(Min, Max):
	var value = randi() % (Max - Min + 1) + Min
	return value

func accept():
	next_card_index = next_card_index_accept
	var stats = stats_accept.duplicate()
	stats[3] = random_int(rand_min_bad, stats_accept[3])
	return stats

func cancel():
	next_card_index = next_card_index_cancel
	var stats = stats_cancel.duplicate()
	stats[3] = random_int(rand_min_study, stats_accept[3])
	return stats

func reset():
	next_card_index = -1

func set_parent(parent):
	self.parent = parent

func next_card(state):
	return parent.cards[next_card_index] if(next_card_index >= 0) else null

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
	
func card_type():
	return CardManager.BINARY_CARD
