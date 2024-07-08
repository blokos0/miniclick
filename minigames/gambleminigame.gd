extends Node2D
func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("gambleclick") and not $animationplayer.is_playing():
		$animationplayer.play("anim")
		global.things -= 1
