extends Node
class_name MessageManager

func game_over_message(player: Player):
	if player.stats["Ejercicios"] == 100:
		return "Terminaste en el neuropsiquiátrico, pero aprobaste con 10"
	else:
		return "Te conseguiste alta wacha, pero te dejó porque no tenés futuro académico"

func wait_message():
	return "..."
