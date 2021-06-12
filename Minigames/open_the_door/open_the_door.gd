extends Node2D
var minigame_end = "res://Scenes/PartyTransition.tscn"
var door_lock = preload("res://Assets/door_lock.tscn").instance()                                                                       
onready var prompt = $Prompt_Screen
onready var timer = $Timer
onready var points = $Points
onready var b_next_minigame = $NextMinigame
onready var t_count_to_lose = $Prompt_Screen/t_count_to_lose
var screen_size_x = -20
var screen_size_y = 60
var t_timer = 3
var t_start = 3
var t_end = 5
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

func _process(delta):
	if door_lock.click:
		b_next_minigame.show()
		t_count_to_lose.stop()
		

func _on_door_lock_pressed():
	pass # Replace with function body.


func _on_t_door_lock_timeout():
	if start:
		door_lock.show()
		points.show()
		timer.show()
		t_timer -= 1
		if !door_lock.click:
			if(t_timer <= 0):
					randomize()
					var rnd_x = rand_range(0,screen_size_x)
					var rnd_y = rand_range(0,screen_size_y)
					print(rnd_x)
					print(rnd_y)
					door_lock.position = Vector2(rnd_x,rnd_y)
					t_timer = 30
		

func _on_Start_Timer_timeout():
	t_start -= 1
	if t_start < 0:
		start = true
		prompt.hide()


func _on_t_count_to_lose_timeout():
	if start:
		t_end -= 1
		timer.text = str(t_end)
		if t_end==0:
			b_next_minigame.show()


func next_scene(): 
	get_tree().change_scene(minigame_end)


func _on_NextMinigame_pressed():
	next_scene()
