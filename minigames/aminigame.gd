extends Node2D
var alltargets = 0
var targets = 0
func _ready():
	var regex = RegEx.new()
	regex.compile("atarget[0-9]?+")
	var results = regex.search_all(str(get_children()))
	for r in results:
		alltargets += 1
func _process(_delta):
	if targets == alltargets:
		global.things += 40
		restart()
	targets = 0
	if Input.is_action_just_pressed("arestart"):
		global.things -= 10
		restart()
func restart():
	var scene = load("res://minigames/aminigame.tscn").instantiate()
	scene.position = position
	get_parent().add_child(scene)
	queue_free()
