extends TextureRect

var scroll_speed = 0.05;

func _ready():
	self.material.set_shader_param("scroll_speed", scroll_speed)
