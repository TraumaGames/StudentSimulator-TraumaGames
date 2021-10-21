extends Control

signal update_bars

onready var statBars = {"Salud": $HealthBar}

func _on_StatBarsManager_update_bars(stats):
	for stat in stats.keys():
		statBars[stat].value = stats[stat]
