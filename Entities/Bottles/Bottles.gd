extends Control
class_name Bottles

export (Texture) var bottles1: Texture
export (Texture) var bottles2: Texture
export (Texture) var bottles3: Texture
export (Texture) var bottles4: Texture

onready var sprite: Sprite = $Sprite


func update_stats(stats):
	if stats[StatManager.Stats.BOTTLES] > 0 && stats[StatManager.Stats.BOTTLES] <= 25:
		sprite.texture = bottles1
	elif stats[StatManager.Stats.BOTTLES] > 25 && stats[StatManager.Stats.BOTTLES] <= 50:
		sprite.texture = bottles2
	elif stats[StatManager.Stats.BOTTLES] > 50 && stats[StatManager.Stats.BOTTLES] <= 75:
		sprite.texture = bottles3
	elif stats[StatManager.Stats.BOTTLES] > 75:
		sprite.texture = bottles4
	else:
		sprite.texture = null
