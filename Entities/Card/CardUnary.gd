extends Control

onready var label:Label= $Label 
onready var button1:ButtonMenu = $CenterContainer/MenuButton
onready var animation_player: AnimationPlayer = $AnimationPlayer

signal new_game()

func initialize(text,button1):
	self.label.text= text
	self.button1.text=button1

func _on_MenuButton_pressed():
	self.hide()
	emit_signal("new_game")

func show_card():
	animation_player.stop()
	show()
	animation_player.play("show")
