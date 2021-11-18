extends AbstractState

func enter():
	.enter()

func update(value):
	var stats = parent.stats()
	get_parent().update(stats)
	

func handle_input(event):
	pass




