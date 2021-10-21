extends Node

onready var card: Card = $Card
onready var player: Player = $Player
onready var stat_bars_manager: StatBarsManager = $StatBarsManager
onready var timer :Timer =$Timer

var index= 0 

func _ready():
	player.initialize(stat_bars_manager)
	run_timer(1.0)
	card.initialize_timer(timer)
	

func run_timer(time):
	timer.set_wait_time(time)
	timer.set_timer_process_mode(0)
	timer.connect("timeout",self,"_on_Timer_timeout")




func _on_HUD_start_game():
	card.update_values("Hola Mundo", "Aceptar", "Cancelar", {"Salud":-50}, {"Salud": -10})
	card.show()
	player.show()
	stat_bars_manager.show()

func _on_Card_close_card(stats_update):
	player.update_stats(stats_update)


func _on_Player_stats_change(stats):
	stat_bars_manager.update_stats(stats)


func _on_Timer_timeout():
	match index: 
		0:
			card.update_values("Chau Mundo", "Aceptar", "Cancelar", {"Salud":-50}, {"Salud": -10})
			card.show()
			next_index()
		1:
			card.update_values("Sale Dejar videojuegos", "Si", "No", {"Salud":+50}, {"Salud": -80})
			card.show()
			next_index()
		
		2:	
			card.update_values("Te gusta Godot?", "Si", "No", {"Salud":+100}, {"Salud": -99})
			card.show()
			next_index()
			
func next_index():
	index+=1
