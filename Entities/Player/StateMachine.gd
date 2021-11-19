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
	elif stats[StatManager.Stats.MENTAL_HEALTH] == 0:
		emit_signal("finished", "insane")
	elif stats[StatManager.Stats.SELF_ESTEEM] == 0:
		emit_signal("finished", "depressed")
	elif stats[StatManager.Stats.ENERGY] == 0:
		emit_signal("finished", "sleeping")
	elif stats[StatManager.Stats.MENTAL_HEALTH] < 25:
		emit_signal("finished", "confused")
	elif stats[StatManager.Stats.SELF_ESTEEM] < 25:
		emit_signal("finished", "blocked")
	elif stats[StatManager.Stats.ENERGY] < 25:
		emit_signal("finished", "tired") 
	else:
		emit_signal("finished", "neutral")
