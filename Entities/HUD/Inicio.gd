extends VBoxContainer

export var scene :PackedScene

var container 

func set_container(container):
	self.container=container

func _on_StartButton_pressed():
	var sc=scene.instance()
	container.add_child(sc)
	self.hide()
