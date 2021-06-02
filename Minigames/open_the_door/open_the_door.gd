extends Node2D

var door_lock = preload("res://Assets/door_lock.tscn").instance()                                                                       
onready var txt_start = $p_text/txt_start                                                                       
onready var txt_instructions = $p_text/txt_start                                                                       


var screen_size_x = -20
var screen_size_y = 120
var timer = 3
var t_start = 3
var start = false


# Called when the node enters the scene tree for the first time.
func _ready():
	
	randomize()
	var rnd_x = rand_range(0,screen_size_x)
	var rnd_y = rand_range(0,screen_size_y)
	print(rnd_x)
	print(rnd_y)
	door_lock.position = Vector2(rnd_x,rnd_y)
	self.add_child(door_lock)
	door_lock.hide()



func _on_door_lock_pressed():
	pass # Replace with function body.


func _on_t_door_lock_timeout():
	if start:
		door_lock.show()
		timer -= 1
		if(timer <= 0):
				randomize()
				var rnd_x = rand_range(0,screen_size_x)
				var rnd_y = rand_range(0,screen_size_y)
				print(rnd_x)
				print(rnd_y)
				door_lock.position = Vector2(rnd_x,rnd_y)
				timer = 30
		


func _on_t_start_timeout():
	
	t_start -= 1
	txt_start.text = String(t_start)
	if t_start < 0:
		start = true
		txt_start.hide()
		txt_instructions.hide()
