extends CharacterBody2D
var jumppower = -800
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumpbuff = 0
var jumpbuffmax = 5
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("thatjump"):
		jumpbuff = jumpbuffmax
	if jumpbuff and is_on_floor():
		velocity.y = jumppower
	jumpbuff = max(jumpbuff - 1, 0)
	move_and_slide()
