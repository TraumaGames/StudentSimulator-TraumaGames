extends TextureRect


signal close_card(stats_select)

onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var card_manager: CardManager = $CardManager
onready var timer: Timer = $Timer
onready var close_timer: Timer = $CloseTimer
onready var player: Player = $Player

func _on_CardManager_close_card(stats_select):
	emit_signal("close_card", stats_select)

func open():
	show()
	animation_player.play("open")
	timer.start()

func close():
	animation_player.play_backwards("open")
	close_timer.start()

func update_stats(stats):
	player.update_stats(stats)

func next_card():
	card_manager.next_card()

func is_empty_card():
	return card_manager.is_empty_card()

func initialize(tag_manager, stat_manager, card_information_manager,button_click):
	card_manager.initialize(tag_manager, stat_manager, card_information_manager,button_click)
	
func reset():
	card_manager.reset()

func _on_Timer_timeout():
	card_manager.show_card()


func _on_CloseTimer_timeout():
	hide()
