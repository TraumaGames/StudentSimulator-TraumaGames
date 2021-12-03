extends Node


var parent
export var text: String
export var text1: String
export var text2: String
export var text3: String
export var correct_option: int = 0
export var next_card_exam: int = 0
#export var upper_stats: Dictionary = {}
#export var lower_stats: Dictionary = {}
#export var tags: Array = []
var next_card_index = -1


func reset():
	next_card_index = -1

func set_parent(parent):
	self.parent = parent

func next_card(state):
	return parent.cards[next_card_index] if(next_card_index >= 0) else null
	
func stats_select(option):
	return {StatManager.Stats.EXAM_POINTS: 1 if option == correct_option else 0}

func card_type():
	return CardManager.CARD_EXAM

