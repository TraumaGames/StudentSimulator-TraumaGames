extends CanvasLayer

signal init_game()

func message_value(msg):
	$Message.text=msg
	$Message.show()
	$MessageTimer.start()

func game_over():
	message_value("Score")
	yield($MessageTimer,"timeout")
	$Button.show()
	$Message.text= "Dodge ball"
	$Message.show() 
	
func update_score(point):
	$ScoreLabel.text=str(point)


func _on_MessageTimer_timeout():
	$Message.hide()


func _on_Button_pressed():
	$Button.hide()
	emit_signal("init_game")
