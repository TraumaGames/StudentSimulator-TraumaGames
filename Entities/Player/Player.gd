extends Sprite
class_name Player

signal update_stats

var statBarsManager

var stats = {"Salud": 100}

func initialize(statBarsManager):
	self.statBarsManager = statBarsManager
	statBarsManager.emit_signal("update_bars", stats)

func _on_Player_update_stats(stats_update):
	var new_stats = {}
	for stat in stats.keys():
		new_stats[stat] = stats[stat] + stats_update[stat]
	stats = new_stats
	statBarsManager.emit_signal("update_bars", stats)
