extends CharacterBody2D
var speed = 300
var jumppower = -900
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumpbuff = 0
var jumpbuffmax = 5
var canmove = false
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("thatjump"):
		jumpbuff = jumpbuffmax
	if jumpbuff and is_on_floor():
		velocity.y = jumppower
	jumpbuff = max(jumpbuff - 1, 0)
	var dir = Input.get_axis("thatleft", "thatright") * int(canmove)
	velocity.x = dir * speed
	move_and_slide()
func _process(_delta):
	$canmovetip.modulate.a = max($canmovetip.modulate.a - 0.02, 0)
