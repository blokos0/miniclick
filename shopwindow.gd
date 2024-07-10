extends Window
func _on_close_requested():
	get_tree().quit()
	global.savefile()
