extends RichTextLabel
func _process(_delta: float) -> void:
	text = str("things: ", global.things)
