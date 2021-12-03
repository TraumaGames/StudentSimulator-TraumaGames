extends Control

onready var label:Label= $Label 
onready var button1:ButtonMenu = $CenterContainer/MenuButton
onready var button2:ButtonMenu = $CenterContainer2/MenuButton
onready var button3:ButtonMenu = $CenterContainer3/MenuButton
onready var button4:ButtonMenu = $CenterContainer4/MenuButton
signal save_result(result)

func initialize(text,buton1,buton2,buton3,buton4):
	self.label.text= text
	self.buton1.text=buton1
	self.buton2.text=buton2
	self.buton3.text=buton3
	self.buton4.text=buton4

func _on_Button_pressed():
	_button_pressed(button1)

func _on_Button2_pressed():
	_button_pressed(button2)

func _on_Button3_pressed():
	_button_pressed(button3)

func _on_Button4_pressed():
	_button_pressed(button4)

func _button_pressed(button: ButtonMenu):
	self.hide()
	emit_signal("save_result", button.text)

func get_type():
	return CardManager.CARD_EXAM
