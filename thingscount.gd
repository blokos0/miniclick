extends RichTextLabel
func _process(_delta):
	text = str("things: ", global.things)
