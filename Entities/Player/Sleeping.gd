extends AbstractState

func enter():
	.enter()

func update(value):
	var stats = parent.stats()
	if stats[StatManager.Stats.ENERGY] == 100 :
		get_parent().update(stats)

func handle_input(event):
	pass
