extends Node
class_name CardInformationManager

export var cardInformationScene: PackedScene
onready var cards: Array = get_children()

var currentInformation

func _ready():
	for card in cards:
		card.set_parent(self)
	reset()

func first_card():
	return cards[0]

func next_card(state):
	currentInformation = currentInformation.next_card(state)
	return currentInformation
	
func reset():
	currentInformation = first_card()

