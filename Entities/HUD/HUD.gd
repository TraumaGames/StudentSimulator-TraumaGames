extends CanvasLayer


func _ready():
	$CenterContainer/PanelContainer/VBoxContainer.set_container(self)
	#$CenterContainer/PanelContainer/VBoxContainer/Card.initialize($CenterContainer/PanelContainer/VBoxContainer/Player)
	#$CenterContainer/PanelContainer/VBoxContainer/Player.initialize($StatBarsManager)
	#$CenterContainer/PanelContainer/VBoxContainer/Card.emit_signal("update_values", "Hola mundo", "Aceptar", "Rechazar", {"Salud": -50}, {"Salud": -10})
