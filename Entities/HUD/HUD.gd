extends CanvasLayer
class_name HUD

signal start_game
signal reset_game

onready var hud_container: Node = $CenterContainer
onready var message_label: Node = $MessageLabel
onready var game_over_message_timer: Timer = $GameOverMessageTimer
onready var message_manager: MessageManager =$MessageManager
onready var card_exam= $Node/CardExam
onready var card_result= $Node/CardUnary
onready var world = $World

var result:String
onready var animation_player: AnimationPlayer = $AnimationPlayer

func game_over(state: Dictionary):
	message_manager.set_unary_card(card_result)
	result = message_manager.game_over_message(state)
	message_manager.generate_exam(self.card_exam,result)
	self.card_exam.show_card()
	
	#message_label.show()
	#game_over_message_timer.start()

func _on_StartButton_pressed():
	hud_container.hide()
	emit_signal("start_game")

func fade():
	animation_player.play("fade")

func wait():
	message_label.text = message_manager.wait_message()
	message_label.show()

func stop_wait():
	message_label.hide()

func _on_GameOverMessageTimer_timeout():
	message_label.hide()
	emit_signal("reset_game")
	hud_container.show()


func _on_CardExam_save_result(text):
	message_manager.save(text)
	message_manager.generate_exam(self.card_exam,result)


func _on_CardUnary_new_game():
	emit_signal("reset_game")
	fade()
	hud_container.show()
