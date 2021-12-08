extends Control
class_name Bottles

export (Texture) var bottles1: Texture
export (Texture) var bottles2: Texture
export (Texture) var bottles3: Texture
export (Texture) var bottles4: Texture
onready var bottle_sound = $AudioStreamPlayer
onready var sprite: Sprite = $Sprite


func update_stats(stats):
	if stats[StatManager.Stats.BOTTLES] > 0 && stats[StatManager.Stats.BOTTLES] <= 25:
		sprite.texture = bottles1
		bottle_sound.play()
	elif stats[StatManager.Stats.BOTTLES] > 25 && stats[StatManager.Stats.BOTTLES] <= 50:
		sprite.texture = bottles2
		bottle_sound.play()
	elif stats[StatManager.Stats.BOTTLES] > 50 && stats[StatManager.Stats.BOTTLES] <= 75:
		sprite.texture = bottles3
		bottle_sound.play()
	elif stats[StatManager.Stats.BOTTLES] > 75:
		sprite.texture = bottles4
		bottle_sound.play()
	else:
		sprite.texture = null
