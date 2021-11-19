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
	
	#print(stats[StatManager.Stats.SELF_ESTEEM])
	
	if(stats[StatManager.Stats.EXERCISES] == 100):
		current_state.emit_signal("finished", "tired")
	elif stats[StatManager.Stats.MENTAL_HEALTH] == 0:
		current_state.emit_signal("finished", "insane")
	elif stats[StatManager.Stats.SELF_ESTEEM] == 0:
		current_state.emit_signal("finished", "depressed")
	elif stats[StatManager.Stats.ENERGY] == 0:
		current_state.emit_signal("finished", "sleeping")
	elif stats[StatManager.Stats.MENTAL_HEALTH] < 20:
		current_state.emit_signal("finished", "confused")
	elif stats[StatManager.Stats.SELF_ESTEEM] < 20:
		current_state.emit_signal("finished", "blocked")
	elif stats[StatManager.Stats.ENERGY] < 20:
		current_state.emit_signal("finished", "tired") 
	else:
		current_state.emit_signal("finished", "neutral")
