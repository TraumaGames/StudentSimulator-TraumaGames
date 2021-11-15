extends Sprite
class_name Player


export var texture_1: Texture
export var texture_2: Texture

func _update_texture(stats):
	if texture == texture_1:
		texture = texture_2
	else:
		texture = texture_1
