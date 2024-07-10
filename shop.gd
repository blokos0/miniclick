extends Node2D
var items = 0
func _ready():
	$panelcontainer/vboxcontainer/example.free()
	get_parent().size = $text.size
	additem("thisminigame", 10, "thiscoolasstriangle", "this minigame", Vector2(128, 336))
	additem("gambleminigame", 15, "gambletile3", "gamblecore", Vector2(64, 585))
	additem("aminigame", 40, "aplayer", "a minigame", Vector2(256, 64))
	additem("thatminigame", 20, "thatcharacter", "that minigame", Vector2(0, 0), true)
func _process(_delta):
	if items == 0:
		$text.text = "[font_size=32][rainbow freq=0.2 sat=0.6][wave]the empty shop"
		get_parent().title = "the empty shop"
func additem(scene, cost, icon, mininame, pos, upgrade = false):
	var button = ShopButton.new()
	button.scene = scene
	button.cost = cost
	button.icon = load(str("res://sprites/", icon, ".png"))
	button.mininame = mininame
	button.pos = pos
	button.upgrade = upgrade
	$panelcontainer/vboxcontainer.add_child(button)
	if not upgrade:
		items += 1
func _on_panelcontainer_resized():
	get_parent().size.y = $text.size.y + $panelcontainer.size.y + 4
	get_parent().size.x = $panelcontainer.size.x + 4
