extends Node2D
var items: int = 0
func _ready() -> void:
	$panelcontainer/vboxcontainer/example.free()
	get_parent().size = $text.size
	additem(1)
	additem(2)
	additem(4)
	additem(3)
	additem(0, true)
func _process(_delta: float) -> void:
	if items == 0:
		$text.text = "[font_size=32][rainbow freq=0.2 sat=0.6][wave]the empty shop"
		get_parent().title = "the empty shop"
func additem(minigame: int, upgrade: bool = false) -> void:
	var button: ShopButton = ShopButton.new()
	button.minigame = minigame
	button.upgrade = upgrade
	$panelcontainer/vboxcontainer.add_child(button)
	if !upgrade:
		items += 1
func _on_panelcontainer_resized() -> void:
	get_parent().size.y = $text.size.y + $panelcontainer.size.y + 4
	get_parent().size.x = $panelcontainer.size.x + 4
