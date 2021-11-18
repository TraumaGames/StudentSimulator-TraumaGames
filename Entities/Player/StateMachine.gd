extends "res://entities/AbstractStateMachine.gd"

extends Node

func _ready():
	states_map = {
		"tired": $Tired,
		"sleeping": $Sleeping
		"depressed": $Depressed
		""
	}
