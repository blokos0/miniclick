extends CharacterBody2D
var speed: int = 300
var jumppower: int = -900
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumpbuff: int = 0
var jumpbuffmax: int = 5
var canmove: bool = false
func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("thatjump"):
		jumpbuff = jumpbuffmax
	if jumpbuff && is_on_floor():
		velocity.y = jumppower
	jumpbuff = max(jumpbuff - 1, 0)
	var dir: float = Input.get_axis("thatleft", "thatright") * int(canmove)
	velocity.x = dir * speed
	move_and_slide()
func _process(_delta: float) -> void:
	$canmovetip.modulate.a = max($canmovetip.modulate.a - 0.02, 0)
