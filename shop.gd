extends Node2D
var items = 0
func _ready():
	$example.free()
	additem("thisminigame", 10, "thiscoolasstriangle", "this minigame", Vector2(128, 336))
	additem("gambleminigame", 15, "gambletile3", "gamblecore", Vector2(64, 585))
	additem("aminigame", 40, "aplayer", "a minigame", Vector2(256, 64))
	addupgrade("thatminigame", 20, "thatcharacter", "that minigame")
	#$background.size.y += 8
func additem(scene, cost, icon, nam, pos):
	var button = Button.new()
	button.icon = load(str("res://sprites/", icon, ".png"))
	button.text = str("buy ", nam, " for just ", cost, " things!")
	button.position.y += items * 48
	button.theme = load("res://theme.tres")
	button.pressed.connect(self._addbutton_pressed.bind(button, cost, str("res://minigames/", scene, ".tscn"), pos))
	add_child(button)
	items += 1
	if button.size.x + 32 > $background.size.x:
		$background.size.x = button.size.x + 32
	$background.size.y += button.size.y + 8
func _addbutton_pressed(button, cost, scene, pos):
	if global.things >= cost:
		global.things -= cost
		var scenel = load(scene).instantiate()
		scenel.position = pos
		get_parent().add_child(scenel)
		button.disabled = true
		items -= 1
		if items == 0:
			$text.text = "[font_size=32][rainbow freq=0.2 sat=0.6][wave]the empty shop"
func addupgrade(scene, cost, icon, nam):
	var button = Button.new()
	button.icon = load(str("res://sprites/", icon, ".png"))
	button.text = str("upgrade ", nam, " for just ", cost, " things!")
	button.position.y += items * 48
	button.theme = load("res://theme.tres")
	button.pressed.connect(self._upgradebutton_pressed.bind(cost, scene))
	add_child(button)
	if button.size.x + 32 > $background.size.x:
		$background.size.x = button.size.x + 32
	$background.size.y += button.size.y + 8
func _upgradebutton_pressed(cost, scene):
	if global.things >= cost:
		global.things -= cost
		get_node(str("../", scene)).upgrade()
