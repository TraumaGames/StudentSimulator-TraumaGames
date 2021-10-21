extends Sprite
class_name Player

signal stats_change

var statBarsManager

var stats = {"Salud": 100}

func initialize(statBarsManager):
	self.statBarsManager = statBarsManager
	emit_signal("stats_change", stats)

func update_stats(stats_update):
	var new_stats = {}
	for stat in stats.keys():
		new_stats[stat] = stats[stat] + stats_update[stat]
	stats = new_stats
	emit_signal("stats_change", stats)
	
