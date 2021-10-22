extends Node

export var cardInformationScene: PackedScene
onready var hud: HUD = $HUD
onready var card: Card = $Card
onready var player: Player = $Player
onready var stat_bars_manager: StatBarsManager = $StatBarsManager
onready var card_timer :Timer =$CardTimer
var cards: Array = []

func _ready():
	_create_cards()
	_set_initial_state()

func _on_HUD_start_game():
	hud.wait()
	player.show()
	stat_bars_manager.show()
	card_timer.start()

func _on_Card_close_card(stats_update):
	player.update_stats(stats_update)
	if card.card_information != null:
		hud.wait()
		card_timer.start()
	else:
		finish_game()

func _on_Player_stats_change(stats):
	stat_bars_manager.update_stats(stats)

func _create_cards():
	for i in range(5):
		cards.append(cardInformationScene.instance())
	cards[0].initialize("Estás en etapas de full parciales, tenés que prepararte para Matemática 2, pero te llamaron a salir un rato a la plaza ¿Cuál es tu decisión?", "Salir a despejarme", "Seguir estudiando", {"Ejercicios": 0}, {"Ejercicios": +50}, cards[1], cards[2])
	
	cards[1].initialize("Elegiste salir un rato y volver a retomar, pero te invitaron a ir a Birgarden a tomar un par de birras, ¿Cuál es tu decisión?", "Irse de gira", "Meterle al estudio", {"Ejercicios": 0}, {"Ejercicios": +75}, cards[3], cards[4])
	cards[2].initialize("Practicaste 2 de 4 ejercicios, agarrás tu celular y te volvieron a invitar, pero a Birgarden a tomar un par de birras un rato, ¿Cuál es tu decisión?", "Irse de gira", "Meterle al estudio", {"Ejercicios": 0}, {"Ejercicios": +25}, cards[3], cards[4])
	
	cards[3].initialize("Ya estás alegre, y no queres parar, pero estas a tiempo de volver, ¿Cuál es tu decisión?", "Escabiar hasta desfallecer", "Estudiar hasta desfallecer", {"Ejercicios": 0}, {"Ejercicios": +25})

	cards[4].initialize("Ya practicaste 3 de 4 ejercicios, pero que tus amigos te insisten una vez más, ¿Cuál es tu decisión?", "Ortivarte", "Dártela en la pera", {"Ejercicios": +25}, {"Ejercicios": 0}, null, cards[3])

func _on_Timer_timeout():
	card.show()
	hud.stop_wait()

func _get_game_over_message():
	if player.stats["Ejercicios"] == 100:
		return "Terminaste en el neuropsiquiátrico, pero aprobaste con 10"
	else:
		return "Te conseguiste alta wacha, pero te dejó porque no tenés futuro académico"

func finish_game():
	hud.game_over(_get_game_over_message())

func _set_initial_state():
	player.hide()
	stat_bars_manager.hide()
	player.initialize(stat_bars_manager)
	player.reset_values()
	card.set_information(cards[0])

func _on_HUD_reset_game():
	_set_initial_state()
	
	
