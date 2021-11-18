extends Node

onready var card_information_manager: CardInformationManager = $CardInformationManager
onready var card_manager: CardManager = $CardManager
onready var tag_manager: TagManager = $TagManager
onready var stat_manager: StatManager = $StatManager
onready var hud: HUD = $HUD
onready var card = $Card
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
	hud.game_over({"stats": stat_manager.stats})

func _on_CardTimer_timeout():
	card_manager.show_card()
	hud.stop_wait()

func _set_initial_state():
	player.hide()
	stat_bars_manager.hide()
	card_manager.hide()
	card_manager.initialize(tag_manager, stat_manager, card_information_manager)
	stat_manager.reset()
	card_manager.reset()


func _on_StatManager_stats_change(stats):
	stat_bars_manager.update_stats(stats)
	player._update_texture(stats)


func _on_CardManager_close_card(stats_update):
	stat_manager.update_stats(stats_update)
	card_manager.next_card()
	if card_manager.is_empty_card():
		finish_game()
	else:
		hud.wait()
		card_timer.start()
