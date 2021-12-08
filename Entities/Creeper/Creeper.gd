extends TextureButton
class_name Creeper


export (Texture) var texture1: Texture
export (Texture) var texture2: Texture

onready var animation_player: AnimationPlayer = $AnimationPlayer

func boom():
	animation_player.play("boom")
