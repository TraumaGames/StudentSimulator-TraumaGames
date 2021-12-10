extends Node

onready var card_information_manager: CardInformationManager = $CardInformationManager
onready var tag_manager: TagManager = $TagManager
onready var stat_manager: StatManager = $StatManager
onready var hud: HUD = $HUD
onready var card = $Card
#onready var player: Player = $OpenedQbook/Player
onready var stat_bars_manager: StatBarsManager = $StatBarsManager
onready var opened_qbook: Node = $OpenedQbook
onready var init_sound :AudioStreamPlayer = $InitSound
onready var qbook_open : AudioStreamPlayer = $QbookOpened
onready var button_play : AudioStreamPlayer = $ButtonSound
onready var calendar: Calendar = $Calendar
onready var books: Books = $Books
onready var bottles: Bottles = $Bottles
onready var creeper: Creeper = $Creeper
onready var background_texture: BackgroundTexture = $ParallaxBackground/ParallaxLayer/BackgroundTexture
onready var stat_dependents: Array = [stat_bars_manager, opened_qbook, books, bottles, background_texture]

func _ready():
	_set_initial_state()

func start_game():
	button_play.play()
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
	for stat_dependent in stat_dependents:
		stat_dependent.update_stats(stats)
#	stat_bars_manager.update_stats(stats)
#	opened_qbook.update_stats(stats)
#	books.update_stats(stats)
#	bottles.update_stats(stats)

func _on_QBook_pressed():
	qbook_open.play()
	opened_qbook.open()

func _on_OpenedQbook_close_card(stats_update):
	hud.fade()
	calendar.set_next_day()
	stat_manager.update_stats(stats_update)
	opened_qbook.next_card()
	opened_qbook.close()
	if opened_qbook.is_empty_card():
		finish_game()

func _on_Creeper_pressed():
	creeper.boom()
