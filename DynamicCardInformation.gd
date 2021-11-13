extends CardInformation

func next_card(state):
	var found_cards: Array = []
	for card in parent.cards:
		found_cards.append(card) if card.contains_tags(state[tags]) && card.verify_stats(state["stats"]) else null
	return found_cards[0] if not found_cards.empty() else null

func next_card_cancel(state):
	return next_card(state)
	
func next_card_accept(state):
	return next_card(state)
