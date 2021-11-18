extends Node


var add_date
var deadline
var label: String
var completion_time # horas
var completed_time
var required_energy
var calendar
#TODO: No funciona
func advance(calendar, stat_manager):
	stat_manager.stats
	required_energy / completion_time
	calendar.advance()

func is_pending_task():
	return deadline == calendar.tomorrow()

func _remaining_completion_time():
	pass
