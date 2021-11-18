extends AbstractStateMachine

func _ready():
	states_map = {
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

##func notify_stat_change():

