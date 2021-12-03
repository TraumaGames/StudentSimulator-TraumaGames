extends Control
class_name CardManager


signal close_card(stats_select)

enum {BINARY_CARD, CARD_EXAM}
export var cards: Dictionary = {}

var cardInformationManager: CardInformationManager
var statManager: StatManager
var tagManager: TagManager
var currentCard
var button_click

func _ready():
	for card in get_children():
		cards[card.get_type()] = card

func initialize(tag_manager: TagManager, stat_manager: StatManager, card_information_manager: CardInformationManager, button_click):
	cardInformationManager = card_information_manager
	statManager = stat_manager
	tagManager = tag_manager
	self.button_click = button_click

func next_card():
	var newInformation = cardInformationManager.next_card({"stats": statManager.stats, "tags": tagManager.currentTags})
	set_current_card()

func set_current_card():
	var information = cardInformationManager.currentInformation
	if information != null:
		currentCard = cards[information.card_type()]
		currentCard.set_information(information)
	else:
		currentCard = null

func reset():
	cardInformationManager.reset()
	set_current_card()

func is_empty_card():
	return currentCard == null

func show_card():
	#show()
	currentCard.show_card()

func _on_Card_close_card(stats_select):
	button_click.play()
	emit_signal("close_card", stats_select)
