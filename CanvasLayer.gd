extends CanvasLayer

signal faded_to_black

func fade_out():
	$AnimationPlayer.play("fade_to_black")

func fade_in():
	$AnimationPlayer.play_backwards("fade_to_black")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		emit_signal("faded_to_black")
		#$AnimationPlayer.play("fade_to_normal")
