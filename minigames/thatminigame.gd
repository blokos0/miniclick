extends Node2D
var upgrades: int = 0
func upgrade() -> void:
	upgrades += 1
	if upgrades == 1:
		$thatcharacter/canmovetip.modulate.a = 1
		loadupgrade()
	if upgrades > 1:
		$thatblock.add = upgrades # meh
		$thatblock2.add = upgrades
		$thatblock3.add = upgrades
func loadupgrade() -> void:
	$thatcharacter.canmove = true
	var block: Resource = load("res://minigames/thatblock.tscn")
	var blocks = block.instantiate()
	blocks.position.x -= 72
	add_child(blocks, true)
	blocks = block.instantiate()
	blocks.position.x += 72
	add_child(blocks, true)
	$thatblock.add = upgrades # meh
	$thatblock2.add = upgrades
	$thatblock3.add = upgrades
