extends Sprite
class_name Player

signal update_stats

var stats = {"Salud": 100}

func _on_Player_update_stats(stats_update):
	var new_stats = {}
	for k in stats.keys():
		new_stats[k] = stats[k] + stats_update[k]
	stats = new_stats
	print(stats)
