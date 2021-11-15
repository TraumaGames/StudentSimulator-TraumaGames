extends CardInformation

func next_card(state):
	var found_cards: Array = []
	for card in parent.cards:
		found_cards.append(card) if card.contains_tags(state[tags]) && card.verify_stats(state["stats"]) else null
	return found_cards[0] if not found_cards.empty() else null

func card_type():
	return CardManager.BINARY_CARD
