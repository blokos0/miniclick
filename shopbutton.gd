class_name ShopButton
extends Button
@export var scene = "null"
@export var cost = 0
@export var mininame = "null"
@export var pos = Vector2(0, 0)
@export var upgrade = false
func _process(_delta):
	var act = "buy "
	if upgrade:
		act = "upgrade "
	text = str(act, mininame, " for just ", cost, " things!")
func _pressed():
	if global.things >= cost:
		global.things -= cost
		if not upgrade:
			var scenel = load(str("res://minigames/", scene, ".tscn")).instantiate()
			scenel.position = pos
			$"/root/mainscene".add_child(scenel)
			disabled = true
			$"../../..".items -= 1
		else:
			$"/root/mainscene".get_node(scene).upgrade()
			cost = int(cost * 1.5)
