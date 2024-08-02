extends Node2D
var alltargets: int = 0
var targets: int = 0
func _ready() -> void:
	for i in find_children("atarget*"):
		alltargets += 1
func _process(_delta: float) -> void:
	if targets == alltargets:
		global.things += 40
		restart()
	targets = 0
	if Input.is_action_just_pressed("arestart"):
		global.things -= 10
		restart()
func restart() -> void:
	var scene: Node2D = load("res://minigames/aminigame.tscn").instantiate()
	scene.position = position
	get_parent().add_child(scene)
	queue_free()
