extends Control



func _ready() -> void:
	$BG/Opsi/Kembali.connect("pressed", self, "hide")
	self.hide()
	self.connect("visibility_changed", self, "on_visibility_changed")
	$BG/Opsi/Tambah.connect("pressed", self, "add_book")


func add_book() -> void:
	Signals.emit_signal("add_book",
			$BG/VBoxContainer/Judul/LineEdit.text,
			$BG/VBoxContainer/Penerbit/LineEdit.text,
			$BG/VBoxContainer/Tahun/LineEdit.text)


func on_visibility_changed() -> void:
	$BG/Opsi/Kembali.grab_focus()

