extends Control


var tasks: Dictionary = {}
var current_tasks: Dictionary = {}
var completed_tasks: Dictionary = {}
var pending_tasks: Dictionary = {}
var calendar
var stat_manager: StatManager

func add_task(task_label):
	current_tasks[task_label] = tasks[task_label]

func complete_task(task_label):
	completed_tasks[task_label] = current_tasks[task_label]
	current_tasks.erase(task_label)
	pending_tasks.erase(task_label)

func do_task(task_label):
	tasks[task_label].advance(calendar, stat_manager)

func change_day():
	_add_tasks_of_the_day()
	_add_pending_tasks()
	
func _add_tasks_of_the_day():
	for task in tasks.values():
		if task.add_date == calendar.date:
			add_task(task.label)
	
func _add_pending_tasks():
	for task_label in current_tasks.keys():
		if tasks[task_label].is_pending_task():
			_add_pending_task(task_label)

func _add_pending_task(task_label):
	pending_tasks[task_label] = current_tasks[task_label]
	
