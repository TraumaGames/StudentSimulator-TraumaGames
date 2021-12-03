extends Control

onready var label:Label= $Label 
onready var buton1:Button = $CenterContainer/Button

signal new_game()

func initialize(text,buton1):
	self.label.text= text
	self.buton1.text=buton1
	


func _on_ButtonUnary_pressed():
	self.hide()
	emit_signal("new_game")
