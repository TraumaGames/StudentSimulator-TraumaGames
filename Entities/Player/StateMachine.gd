extends AbstractStateMachine

func _ready():
	states_map = {
		"neutral":$Neutral,
		"tired": $Tired,
		"rested": $Rested,
		"sleeping": $Sleeping,
		"confused": $Confused,
		"calm": $Calm,
		"insane": $Insane,
		"depressed": $Depressed,
		"happy": $Happy,
		"blocked": $Blocked
	}

func notify_stats_updated(stats):
	if(stats[3] == 100):
		var parent = self.get_parent()
		parent.texture = parent.texture_2
	#for stat in stats.keys():
	#	print(stats[stat])
