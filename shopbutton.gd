class_name ShopButton
extends Button
@export var minigame: int = 0
@export var upgrade: bool = false
func _process(_delta: float) -> void:
	var act: String = "buy "
	var cost: int = global.minigames["buycost"][minigame]
	if upgrade:
		act = "upgrade "
		cost = global.minigames["upgradecost"][minigame]
	text = str(act, global.minigames["name"][minigame], " for just ", cost, " things!")
	icon = load(str("res://sprites/", global.minigames["icon"][minigame], ".png"))
	if !upgrade && global.minigames["bought"][minigame]:
		disabled = true
func _pressed() -> void:
	var cost: int = global.minigames["buycost"][minigame]
	if upgrade:
		cost = global.minigames["upgradecost"][minigame]
	if global.things >= cost:
		global.things -= cost
		if !upgrade:
			global.loadminigame(minigame)
			disabled = true
			$"../../..".items -= 1
			global.minigames["bought"][minigame] = true
		else:
			$"/root/mainscene".get_node(global.minigames["scene"][minigame]).upgrade()
			global.minigames["upgradecost"][minigame] = int(global.minigames["upgradecost"][minigame] * 1.5)
			global.minigames["upgradecount"][minigame] += 1
