extends Node

onready var card_information_manager: CardInformationManager = $CardInformationManager
onready var hud: HUD = $HUD
onready var card: Card = $Card
onready var player: Player = $Player
onready var stat_bars_manager: StatBarsManager = $StatBarsManager
onready var card_timer: Timer =$CardTimer

func _ready():
	_set_initial_state()

func start_game():
	hud.wait()
	player.show()
	stat_bars_manager.show()
	card_timer.start()

func reset_game():
	_set_initial_state()

func finish_game():
	hud.game_over(player)

func _on_Card_close_card(stats_update):
	player.update_stats(stats_update)
	if card.card_information != null:
		hud.wait()
		card_timer.start()
	else:
		finish_game()

func _on_Player_stats_change(stats):
	stat_bars_manager.update_stats(stats)

func _on_CardTimer_timeout():
	card.show()
	hud.stop_wait()

func _set_initial_state():
	player.hide()
	stat_bars_manager.hide()
	player.initialize(stat_bars_manager)
	player.reset_values()
	card.set_information(card_information_manager.first_card())
