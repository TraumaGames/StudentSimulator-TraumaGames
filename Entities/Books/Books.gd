extends Control
class_name Books


export (Texture) var books1: Texture
export (Texture) var books2: Texture
export (Texture) var books3: Texture
export (Texture) var books4: Texture

onready var sprite: Sprite = $Sprite


func update_stats(stats):
	if stats[StatManager.Stats.BOOKS] > 0 && stats[StatManager.Stats.BOOKS] <= 25:
		sprite.texture = books1
	elif stats[StatManager.Stats.BOOKS] > 25 && stats[StatManager.Stats.BOOKS] <= 50:
		sprite.texture = books2
	elif stats[StatManager.Stats.BOOKS] > 50 && stats[StatManager.Stats.BOOKS] <= 75:
		sprite.texture = books3
	elif stats[StatManager.Stats.BOOKS] > 75:
		sprite.texture = books4
	else:
		sprite.texture = null
