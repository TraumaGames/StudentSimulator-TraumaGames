extends Node

onready var card_information_manager: CardInformationManager = $CardInformationManager
onready var tag_manager: TagManager = $TagManager
onready var stat_manager: StatManager = $StatManager
onready var hud: HUD = $HUD
onready var card = $Card
onready var player: Player = $Player
onready var stat_bars_manager: StatBarsManager = $StatBarsManager
onready var opened_qbook: Node =$OpenedQbook
onready var init_sound :AudioStreamPlayer = $InitSound
onready var qbook_open : AudioStreamPlayer = $QbookOpened
onready var button_play : AudioStreamPlayer = $ButtonSound
onready var calendar: Calendar = $Calendar
onready var books: Books = $Books

func _ready():
	_set_initial_state()

func start_game():
	button_play.play()
	init_sound.stop()
	stat_bars_manager.show()
	
func reset_game():
	opened_qbook.close()
	_set_initial_state()

func finish_game():
	qbook_open.play()
	opened_qbook.just_open()
	hud.game_over({"stats": stat_manager.stats})

func _set_initial_state():
	calendar.reset()
	init_sound.play()
	stat_bars_manager.hide()
	opened_qbook.initialize(tag_manager, stat_manager, card_information_manager,button_play)
	stat_manager.reset()
	opened_qbook.reset()

func _on_StatManager_stats_change(stats):
	stat_bars_manager.update_stats(stats)
	opened_qbook.update_stats(stats)
	books.update_stats(stats)

func _on_QBook_pressed():
	qbook_open.play()
	opened_qbook.open()

func _on_OpenedQbook_close_card(stats_update):
	calendar.set_next_day()
	stat_manager.update_stats(stats_update)
	opened_qbook.next_card()
	opened_qbook.close()
	if opened_qbook.is_empty_card():
		finish_game()
