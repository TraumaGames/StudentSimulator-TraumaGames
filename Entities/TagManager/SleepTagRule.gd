extends AbstractTagRule


func verify_add_condition(stats):
	return stats[StatManager.Stats.ENERGY] == 0
