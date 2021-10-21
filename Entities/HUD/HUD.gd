extends CanvasLayer

signal start_game

onready var hud_container: Node = $CenterContainer

func _ready():
	pass	
	#$CenterContainer/PanelContainer/VBoxContainer/Card.initialize($CenterContainer/PanelContainer/VBoxContainer/Player)
	#$CenterContainer/PanelContainer/VBoxContainer/Player.initialize($StatBarsManager)
	#$CenterContainer/PanelContainer/VBoxContainer/Card.emit_signal("update_values", "Hola mundo", "Aceptar", "Rechazar", {"Salud": -50}, {"Salud": -10})


func _on_StartButton_pressed():
	hud_container.hide()
	emit_signal("start_game")
