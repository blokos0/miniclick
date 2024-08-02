extends Node
var things: int = 0
var savetimemax: int = 300
var savetime: int = savetimemax
var minigames: Dictionary = {
	"scene" = ["thatminigame", "thisminigame", "gambleminigame", "aminigame", "simonminigame"],
	"buycost" = [0, 10, 15, 40, 25],
	"upgradecost" = [20, 0, 0, 0, 0],
	"icon" = ["thatcharacter", "thiscoolasstriangle", "gambletile3", "aplayer", "simonsaysicon"],
	"name" = ["that minigame", "this minigame", "gamblecore", "a minigame", "simon says"],
	"pos" = [Vector2(128, 256), Vector2(128, 336), Vector2(64, 585), Vector2(256, 64), Vector2(320, 384)],
	"bought" = [false, false, false, false, false],
	"upgradecount" = [0, 0, 0, 0, 0]
}
func _ready() -> void:
	loadfile()
func _process(_delta: float) -> void:
	things = max(things, 0)
	savetime -= 1
	if savetime == 0:
		savefile()
		savetime = savetimemax
	if Input.is_action_just_pressed("ui_end"):
		OS.shell_open(ProjectSettings.globalize_path("user://"))
func savefile() -> void:
	var file: FileAccess = FileAccess.open("user://save.txt", FileAccess.WRITE)
	file.store_line(str(things))
	file.store_line(str($"/root/mainscene/shopwindow".position))
	file.store_line(JSON.stringify(minigames))
	file.close()
	print("saved")
func loadfile() -> void:
	var file: FileAccess = FileAccess.open("user://save.txt", FileAccess.READ)
	if file != null && !file.get_as_text().is_empty():
		things = int(file.get_line())
		$"/root/mainscene/shopwindow".position = str_to_var("Vector2" + file.get_line())
		minigames = JSON.parse_string(file.get_line())
		file.close()
		for i in range(minigames["scene"].size()):
			if minigames["bought"][i]:
				loadminigame(i)
			if has_node(str(^"/root/mainscene", minigames["scene"][i])):
				var mg: Node = $"/root/mainscene".get_node(minigames["scene"][i])
				if mg.has_method("upgrade"):
					mg.upgrades = minigames["upgradecount"][i]
					mg.loadupgrade() # stuff that should immediately be loaded
		print("loaded")
func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		savefile()
func loadminigame(minigame: int) -> void:
	var scenel: Node2D = load(str("res://minigames/", global.minigames["scene"][minigame], ".tscn")).instantiate()
	scenel.position = str_to_var(str("Vector2", global.minigames["pos"][minigame])) # why is it a string???
	$"/root/mainscene".add_child(scenel, true)
