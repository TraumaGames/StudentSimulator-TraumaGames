extends Control

onready var label:Label= $Label 
onready var buton1:Button = $CenterContainer/Button
onready var buton2:Button = $CenterContainer2/Button
onready var buton3:Button = $CenterContainer3/Button
onready var buton4:Button = $CenterContainer4/Button
signal save_result(result)

func initialize(text,buton1,buton2,buton3,buton4):
	self.label.text= text
	self.buton1.text=buton1
	self.buton2.text=buton2
	self.buton3.text=buton3
	self.buton4.text=buton4


func _on_Button_pressed():
	self.hide()
	emit_signal("save_result",buton1.text)


func _on_Button2_pressed():
	self.hide()
	emit_signal("save_result",buton2.text)


func _on_Button3_pressed():
	self.hide()
	emit_signal("save_result",buton3.text)


func _on_Button4_pressed():
	self.hide()
	emit_signal("save_result",buton4.text)
