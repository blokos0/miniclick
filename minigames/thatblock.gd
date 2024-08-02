extends StaticBody2D
@onready var spryinit = $sprite2d.position.y
var spry: int = 0
var spryspd: int = 0
var add: int = 1
func _process(_delta: float) -> void:
	spryspd = min(spryspd + 1, 20)
	spry = min(spry + spryspd, spryinit)
	$sprite2d.position.y = spry
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "thatcharacter":
		global.things += add
		body.velocity.y = 128
		spryspd = -8
