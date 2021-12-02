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
onready var opened_qbook: Node =$OpenedQbook
onready var init_sound : AudioStreamPlayer = $InitSound
onready var open_qbook : AudioStreamPlayer = $OnQBook
onready var button_start : AudioStreamPlayer = $PlaySoundButton
onready var card_sound: AudioStreamPlayer = $CardSound
onready var next_card_button_click : AudioStreamPlayer = $NextCardClick


func _ready():
	_set_initial_state()

func start_game():
	hud.wait()
	player.show()
	stat_bars_manager.show()
	card_timer.start()
	button_start.play()
	init_sound.stop()

	
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
	card_manager.initialize(tag_manager, stat_manager, card_information_manager,card_sound)
	stat_manager.reset()
	card_manager.reset()


func _on_StatManager_stats_change(stats):
	stat_bars_manager.update_stats(stats)
	player.update_stats(stats)


func _on_CardManager_close_card(stats_update):
	stat_manager.update_stats(stats_update)
	next_card_button_click.play()
	card_manager.next_card()
	if card_manager.is_empty_card():
		finish_game()
	else:
		hud.wait()
		card_timer.start()


func _on_QBook_pressed():
	opened_qbook.show()
	open_qbook.play()
