extends Node2D
func _process(_delta: float) -> void:
	var col: Array = $targetarea.get_overlapping_areas()
	for c in col:
		if "boxarea" in c.name:
			get_parent().targets += 1
