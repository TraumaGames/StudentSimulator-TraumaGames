extends Control
class_name BackgroundTexture


export (Texture) var room1: Texture
export (Texture) var room2: Texture
export (Texture) var room3: Texture
export (Texture) var room4: Texture

onready var sprite: Sprite = $Sprite


func update_stats(stats):
	if stats[StatManager.Stats.STUDY] > 0 && stats[StatManager.Stats.STUDY] <= 25:
		sprite.texture = room2
	elif stats[StatManager.Stats.STUDY] > 25 && stats[StatManager.Stats.STUDY] <= 50:
		sprite.texture = room3
	elif stats[StatManager.Stats.STUDY] > 50 && stats[StatManager.Stats.STUDY] <= 75:
		sprite.texture = room4
	elif stats[StatManager.Stats.STUDY] > 75:
		sprite.texture = room4
	else:
		sprite.texture = room1
