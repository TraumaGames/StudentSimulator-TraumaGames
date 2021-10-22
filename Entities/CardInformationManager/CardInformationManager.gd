extends Node
class_name CardInformationManager

export var cardInformationScene: PackedScene
var cards: Array

func _ready():
	_create_cards()
	
func _create_cards():
	for i in range(5):
		cards.append(cardInformationScene.instance())
	cards[0].initialize("Estás en etapas de full parciales, tenés que prepararte para Matemática 2, pero te llamaron a salir un rato a la plaza ¿Cuál es tu decisión?", "Salir a despejarme", "Seguir estudiando", {"Ejercicios": 0}, {"Ejercicios": +50}, cards[1], cards[2])
	
	cards[1].initialize("Elegiste salir un rato y volver a retomar, pero te invitaron a ir a Birgarden a tomar un par de birras, ¿Cuál es tu decisión?", "Irse de gira", "Meterle al estudio", {"Ejercicios": 0}, {"Ejercicios": +75}, cards[3], cards[4])
	cards[2].initialize("Practicaste 2 de 4 ejercicios, agarrás tu celular y te volvieron a invitar, pero a Birgarden a tomar un par de birras un rato, ¿Cuál es tu decisión?", "Irse de gira", "Meterle al estudio", {"Ejercicios": 0}, {"Ejercicios": +25}, cards[3], cards[4])
	
	cards[3].initialize("Ya estás alegre, y no queres parar, pero estas a tiempo de volver, ¿Cuál es tu decisión?", "Escabiar hasta desfallecer", "Estudiar hasta desfallecer", {"Ejercicios": 0}, {"Ejercicios": +25})

	cards[4].initialize("Ya practicaste 3 de 4 ejercicios, pero que tus amigos te insisten una vez más, ¿Cuál es tu decisión?", "Ortivarte", "Dártela en la pera", {"Ejercicios": +25}, {"Ejercicios": 0}, null, cards[3])

func first_card():
	return cards[0]
