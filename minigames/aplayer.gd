extends Node2D
var dirx: int = 0
var diry: int = 0
var dir: Vector2 = Vector2(0, 0)
func _process(_delta: float) -> void:
	# so messy
	dirx = float(Input.is_action_just_pressed("aright")) - float(Input.is_action_just_pressed("aleft"))
	diry = float(Input.is_action_just_pressed("adown")) - float(Input.is_action_just_pressed("aup"))
	if dirx != 0 && diry != 0:
		diry = 0
	dir = Vector2(dirx, diry)
	position += dir * 32
	var colu: Array = $playerareaup.get_overlapping_areas()
	var colu2: Array = $playerareaup2.get_overlapping_areas()
	var cold: Array = $playerareadown.get_overlapping_areas()
	var cold2: Array = $playerareadown2.get_overlapping_areas()
	var coll: Array = $playerarealeft.get_overlapping_areas()
	var coll2: Array = $playerarealeft2.get_overlapping_areas()
	var colr: Array = $playerarearight.get_overlapping_areas()
	var colr2: Array = $playerarearight2.get_overlapping_areas()
	var dirtiles: Dictionary = {
		"colu" = colu,
		"cold" = cold,
		"coll" = coll,
		"colr" = colr
	}
	var exdirtiles: Dictionary = {
		"colu2" = colu2,
		"cold2" = cold2,
		"coll2" = coll2,
		"colr2" = colr2
	}
	var dirs: Dictionary = {
		"(0, -1)" = "u",
		"(0, 1)" = "d",
		"(-1, 0)" = "l",
		"(1, 0)" = "r"
	}
	if dir:
		print("direction: ", dir)
		var dirstr: String = dirs[str(dir)]
		print("direction (letter): ", dirstr)
		var dirtile: Array = dirtiles[str("col", dirstr)]
		print("tiles in front: ", dirtile)
		var exdirtile: Array = exdirtiles[str("col", dirstr, "2")]
		print("tiles further: ", exdirtile)
		for t in dirtile:
			if "boxarea" in t.name:
				if len(exdirtile):
					var exdirtilename: Array = namify(exdirtile)
					if "wallarea" not in exdirtilename and "boxarea" not in exdirtilename:
						t.get_parent().position += dir * 32
					else:
						position -= dir * 32
				else:
					t.get_parent().position += dir * 32
			elif "wallarea" in t.name:
				position -= dir * 32
func namify(array: Array) -> Array:
	var ret = []
	for i in array:
		ret.append(i.name)
	return(ret)
