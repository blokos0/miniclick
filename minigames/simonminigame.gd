extends Node2D
var patneed: Array = []
var patplay: Array = []
var curpickprev: int = -1
var curpick: int = -1
var curpicktrue: int = -1
var curpickind: int = -1
func _ready() -> void:
	gen()
func _process(_delta: float) -> void:
	var h: Array = [$sprite2d/hover.button_pressed, $sprite2d/hover1.button_pressed, $sprite2d/hover2.button_pressed, $sprite2d/hover3.button_pressed]
	curpickprev = curpick
	curpick = h.find(true)
	if curpickprev != curpick:
		curpicktrue = curpick
	else:
		curpicktrue = -1
	if curpicktrue != -1:
		curpickind += 1
		patplay.append(curpicktrue)
		$sfx.stop()
		$animationplayer.play("RESET")
		$animationplayer.seek(0)
		$animationplayer.play(str(curpicktrue, "u"))
		if curpicktrue != patneed[curpickind]:
			global.things -= (curpickind + 1) * 3
			print("oh... starting all over again!!!")
			$animationplayer.play("lost")
			patplay = []
			patneed = []
			curpickind = -1
			gen()
		else:
			global.things += 3
		if len(patplay) == len(patneed):
			print("yay!!! generating some new stuff!!!")
			patplay = []
			curpickind = -1
			gen()
func gen() -> void:
	var anim: int = randi_range(0, 3)
	patneed.append(anim)
	for i in patneed:
		$animationplayer.queue(str(i))
