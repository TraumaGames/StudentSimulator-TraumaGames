extends Control

onready var label:Label= $Label 
onready var button1:ButtonMenu = $CenterContainer/MenuButton
onready var button2:ButtonMenu = $CenterContainer2/MenuButton2
onready var button3:ButtonMenu = $CenterContainer3/MenuButton3
onready var button4:ButtonMenu = $CenterContainer4/MenuButton4
signal save_result(result)

func initialize(text,button1,button2,button3,button4):
	self.label.text= text
	self.button1.text=button1
	self.button2.text=button2
	self.button3.text=button3
	self.button4.text=button4


func _on_MenuButton_pressed():
	_button_pressed(button1)

func _on_MenuButton2_pressed():
	_button_pressed(button2)


func _on_MenuButton3_pressed():
	_button_pressed(button3)


func _on_MenuButton4_pressed():
	_button_pressed(button4)
	
func _button_pressed(button: ButtonMenu):
	self.hide()
	emit_signal("save_result",button.text)
