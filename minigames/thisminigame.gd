extends Node2D
func _ready() -> void:
	$thisarrow/animationplayer.play("movearound")
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("thisarrow"):
		if $thisarrow.position.x >= -32 && $thisarrow.position.x <= 32:
			$thiscircle/animationplayer.play("boom")
			$sfx.stream = load("res://sounds/vineboom.ogg")
			$sfx.play()
			global.things += 3
		else:
			$sfx.stream = load("res://sounds/boowomp.ogg")
			$sfx.play()
			global.things -= 3
