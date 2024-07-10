extends Node
var things = 0
var savetimemax = 300
var savetime = savetimemax
func _ready():
	loadfile()
func _process(_delta):
	things = max(things, 0)
	savetime -= 1
	if savetime == 0:
		savefile()
		savetime = savetimemax
func savefile():
	var file = FileAccess.open("user://save.txt", FileAccess.WRITE)
	file.store_line(str(global.things))
	file.store_line(str($"/root/mainscene/shopwindow".position))
	file.close()
	print("saved")
func loadfile():
	var file = FileAccess.open("user://save.txt", FileAccess.READ)
	if file != null:
		global.things = int(file.get_line())
		$"/root/mainscene/shopwindow".position = str_to_var("Vector2" + file.get_line())
		file.close()
		print("loaded")
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		savefile()
