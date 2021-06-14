extends Button


func ready():
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")


func _on_mouse_entrered():
	print("oasidfjoasdij")
