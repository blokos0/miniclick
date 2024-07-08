extends Node2D
var items = 0
func _ready():
	$panelcontainer/vboxcontainer/example.free()
	get_parent().size = $text.size
	additem("thisminigame", 10, "thiscoolasstriangle", "this minigame", Vector2(128, 336))
	additem("gambleminigame", 15, "gambletile3", "gamblecore", Vector2(64, 585))
	additem("aminigame", 40, "aplayer", "a minigame", Vector2(256, 64))
	addupgrade("thatminigame", 20, "thatcharacter", "that minigame")
func additem(scene, cost, icon, nam, pos):
	var button = Button.new()
	button.icon = load(str("res://sprites/", icon, ".png"))
	button.text = str("buy ", nam, " for just ", cost, " things!")
	button.position.y += items * 48
	button.theme = load("res://theme.tres")
	button.pressed.connect(self._addbutton_pressed.bind(button, cost, str("res://minigames/", scene, ".tscn"), pos))
	$panelcontainer/vboxcontainer.add_child(button)
	items += 1
func _addbutton_pressed(button, cost, scene, pos):
	if global.things >= cost:
		global.things -= cost
		var scenel = load(scene).instantiate()
		scenel.position = pos
		get_parent().get_parent().add_child(scenel)
		button.disabled = true
		items -= 1
		if items == 0:
			$text.text = "[font_size=32][rainbow freq=0.2 sat=0.6][wave]the empty shop"
			get_parent().title = "the empty shop"
func addupgrade(scene, cost, icon, nam):
	var button = Button.new()
	button.icon = load(str("res://sprites/", icon, ".png"))
	button.text = str("upgrade ", nam, " for just ", cost, " things!")
	button.position.y += items * 48
	button.theme = load("res://theme.tres")
	button.pressed.connect(self._upgradebutton_pressed.bind(cost, scene))
	$panelcontainer/vboxcontainer.add_child(button)
func _upgradebutton_pressed(cost, scene):
	if global.things >= cost:
		global.things -= cost
		get_parent().get_parent().get_node(scene).upgrade()
func _on_panelcontainer_resized():
	get_parent().size.y += $panelcontainer.size.y + 4
	get_parent().size.x = $panelcontainer.size.x + 4
