extends CanvasLayer

var user_inventory: Dictionary
var dir: String = "user://data.json"


func _ready() -> void:
	$Background/Options/Tambah.connect("pressed", $Popup, "show")
	Signals.connect("add_book", self, "add_book")


func add_book(
			judul: String, penerbit: String, tahun: String) -> void:
	var list = [judul, penerbit, tahun]
	user_inventory["list_" + str(user_inventory.size())] = list
	write(user_inventory)


func write(content) -> void:
	var file = File.new()
	var data = file.get_as_text()
	file.open("user://save_game.json", File.WRITE)
	var string = JSON.print(content)
	ResourceSaver.save(dir, string)
	file.close()


func read():
	ResourceLoader.load(dir)
	var file = File.new()
	var content = file.get_as_text()
	var data: Dictionary = JSON.parse(content).result
	user_inventory = data
	file.close()
	return content
