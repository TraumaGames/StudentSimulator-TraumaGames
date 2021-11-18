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



func update(stats):
	
	if(stats[StatManager.Stats.EXERCISES] == 100):
		print("if")
		current_state.emit_signal("finished", "tired")
	#elif stats[StatManager.Stats.MENTAL_HEALTH] == 0:
	#	emit_signal("finished", "insane")
	else:
		emit_signal("finished", "neutral")
