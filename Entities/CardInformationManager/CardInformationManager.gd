extends Node
class_name CardInformationManager

export var cardInformationScene: PackedScene
onready var cards: Array = get_children()

func _ready():
	for card in cards:
		card.set_parent(self)

func first_card():
	return cards[0]
