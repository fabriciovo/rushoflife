extends Node2D

var door_lock = preload("res://Assets/door_lock.tscn").instance()                                                                       
var screen_size_x = 50
var screen_size_y = 120
var timer = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var rnd_x = rand_range(0,screen_size_x)
	var rnd_y = rand_range(0,screen_size_y)
	print(rnd_x)
	print(rnd_y)
	door_lock.position = Vector2(rnd_x,rnd_y)
	self.add_child(door_lock)



func _on_door_lock_pressed():
	pass # Replace with function body.


func _on_t_door_lock_timeout():
	timer -= 1
	if(timer <= 0):
			randomize()
			var rnd_x = rand_range(0,screen_size_x)
			var rnd_y = rand_range(0,screen_size_y)
			print(rnd_x)
			print(rnd_y)
			door_lock.position = Vector2(rnd_x,rnd_y)
			timer = 20
		
