extends Node2D
var upgrades = 0
func upgrade():
	upgrades += 1
	if upgrades == 1:
		$thatcharacter.canmove = true
		$thatcharacter/canmovetip.modulate.a = 1
		var block = load("res://minigames/thatblock.tscn")
		var blocks = block.instantiate()
		blocks.position.x -= 72
		add_child(blocks, true)
		blocks = block.instantiate()
		blocks.position.x += 72
		add_child(blocks, true)
	else:
		$thatblock.add += 1 # meh
		$thatblock2.add += 1
		$thatblock3.add += 1
