extends AbstractState

func enter():
	.enter()

func update(value):
	var stats = parent.stats()
	if(stats[StatManager.Stats.EXERCISES] == 0):
		emit_signal("finished", "neutral")
