extends Control
class_name StatBarsManager

onready var statBars = {
#	"Salud": $HealthBar,
	StatManager.Stats.EXERCISES: $HealthBar
	}


func update_stats(stats):
	for stat in statBars.keys():
		statBars[stat].value = stats[stat]
