extends Node

onready var card: Card = $Card
onready var player: Player = $Player
onready var stat_bars_manager: StatBarsManager = $StatBarsManager

func _ready():
	player.initialize(stat_bars_manager)

func _on_HUD_start_game():
	card.update_values("Hola Mundo", "Aceptar", "Cancelar", {"Salud":-50}, {"Salud": -10})
	card.show()
	player.show()
	stat_bars_manager.show()

func _on_Card_close_card(stats_update):
	player.update_stats(stats_update)

func _on_Player_stats_change(stats):
	stat_bars_manager.update_stats(stats)
