extends StaticBody2D
var spryinit = 0
var spry = 0
var spryspd = 0
var add = 1
func _ready():
	spryinit = $sprite2d.position.y
func _process(_delta):
	spryspd = min(spryspd + 1, 20)
	spry = min(spry + spryspd, spryinit)
	$sprite2d.position.y = spry
func _on_area_2d_body_entered(body):
	if body.name == "thatcharacter":
		global.things += add
		body.velocity.y = 128
		spryspd = -8
