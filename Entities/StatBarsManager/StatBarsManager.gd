extends Control
class_name StatBarsManager

onready var statBars = {"Salud": $HealthBar}

func update_stats(stats):
	for stat in stats.keys():
		statBars[stat].value = stats[stat]
