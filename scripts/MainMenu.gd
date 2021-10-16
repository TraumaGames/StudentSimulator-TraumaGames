extends Control


func _ready():
	var main_menu_button=preload("res://MainButtons/MainButton.tscn")	
	var main_buttons=["Start game" , "How to Play"]
	
	for i in range(main_buttons.size()):
		var instance= main_menu_button.instance()
		instance.text=main_buttons[i]
		$CenterContainer/PanelContainer/VBoxContainer/Buttons.add_child(instance)
			
