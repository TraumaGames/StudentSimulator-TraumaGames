extends CanvasLayer
class_name HUD

signal start_game
signal reset_game

onready var hud_container: Node = $CenterContainer
onready var message_label: Node = $MessageLabel
onready var game_over_message_timer: Timer = $GameOverMessageTimer

func game_over(message: String):
	message_label.text = message
	message_label.show()
	game_over_message_timer.start()

func _on_StartButton_pressed():
	hud_container.hide()
	emit_signal("start_game")

func wait():
	message_label.text = "..."
	message_label.show()

func stop_wait():
	message_label.hide()

func _on_GameOverMessageTimer_timeout():
	message_label.hide()
	emit_signal("reset_game")
	hud_container.show()
