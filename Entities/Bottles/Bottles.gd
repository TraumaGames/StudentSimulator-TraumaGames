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
		bottle_sound.play() if sprite.texture != bottles1 else null
		sprite.texture = bottles1
	elif stats[StatManager.Stats.BOTTLES] > 25 && stats[StatManager.Stats.BOTTLES] <= 50:
		bottle_sound.play() if sprite.texture != bottles2 else null
		sprite.texture = bottles2
	elif stats[StatManager.Stats.BOTTLES] > 50 && stats[StatManager.Stats.BOTTLES] <= 75:
		bottle_sound.play() if sprite.texture != bottles3 else null
		sprite.texture = bottles3
	elif stats[StatManager.Stats.BOTTLES] > 75:
		bottle_sound.play() if sprite.texture != bottles4 else null
		sprite.texture = bottles4
	else:
		sprite.texture = null
