extends Node
class_name StatManager

signal stats_change(stats)

enum Stats {ENERGY, SELF_ESTEEM, MENTAL_HEALTH, EXERCISES, BOOKS, BOTTLES}

var _initialStats: Dictionary = {
	Stats.ENERGY: 100,
	Stats.SELF_ESTEEM: 50,
	Stats.MENTAL_HEALTH: 100,
	Stats.EXERCISES: 0,
	Stats.BOOKS: 0,
	Stats.BOTTLES: 0
}

var stats = _initialStats.duplicate()

func update_stats(stats_update: Dictionary):
	var new_stats = stats
	for stat in stats_update.keys():
		new_stats[stat] = clamp(stats[stat] + stats_update[stat], 0, 100)
	stats = new_stats
	emit_signal("stats_change", stats)

func reset():
	stats = _initialStats.duplicate()
	emit_signal("stats_change", stats)
