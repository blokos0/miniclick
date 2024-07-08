extends Node2D
var dirx = 0
var diry = 0
var dir = Vector2(0, 0)
func _process(_delta):
	dirx = float(Input.is_action_just_pressed("aright")) - float(Input.is_action_just_pressed("aleft"))
	diry = float(Input.is_action_just_pressed("adown")) - float(Input.is_action_just_pressed("aup"))
	if dirx != 0 and diry != 0:
		diry = 0
	dir = Vector2(dirx, diry)
	position += dir * 32
	var colu = $playerareaup.get_overlapping_areas()
	var colu2 = $playerareaup2.get_overlapping_areas()
	var cold = $playerareadown.get_overlapping_areas()
	var cold2 = $playerareadown2.get_overlapping_areas()
	var coll = $playerarealeft.get_overlapping_areas()
	var coll2 = $playerarealeft2.get_overlapping_areas()
	var colr = $playerarearight.get_overlapping_areas()
	var colr2 = $playerarearight2.get_overlapping_areas()
	var dirtiles = {
		"colu" = colu,
		"cold" = cold,
		"coll" = coll,
		"colr" = colr
	}
	var exdirtiles = {
		"colu2" = colu2,
		"cold2" = cold2,
		"coll2" = coll2,
		"colr2" = colr2
	}
	var dirs = {
		"(0, -1)" = "u",
		"(0, 1)" = "d",
		"(-1, 0)" = "l",
		"(1, 0)" = "r"
	}
	# process:
	# find the current direction in dirs: dirs[str(dir)]
	# make the needed key: dirtiles[str("col", dirstr)] and exdirtiles[str("col", dirstr, "2")]
	# loop throguh that keys tiles: for t in dirtile
	# replace if diry == 1 to if dir == dirs[b] for example: just remove it lol
	# catch multiple extiles: use "thing" in namify(exdirtile) instead
	# wow this is too complicated: indeed
	if dir:
		print("direction: ", dir)
		var dirstr = dirs[str(dir)]
		print("direction (letter): ", dirstr)
		var dirtile = dirtiles[str("col", dirstr)]
		print("tiles in front: ", dirtile)
		var exdirtile = exdirtiles[str("col", dirstr, "2")]
		print("tiles further: ", exdirtile)
		for t in dirtile:
			if "boxarea" in t.name:
				if len(exdirtile):
					var exdirtilename = namify(exdirtile)
					if "wallarea" not in exdirtilename and "boxarea" not in exdirtilename:
						t.get_parent().position += dir * 32
					else:
						position -= dir * 32
				else:
					t.get_parent().position += dir * 32
			elif "wallarea" in t.name:
				position -= dir * 32
func namify(array):
	var ret = []
	for i in array:
		ret.append(i.name)
	return(ret)
