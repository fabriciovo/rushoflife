extends Node2D
var minigame_end = "res://Scenes/Minigame_end.tscn"
var door_lock = preload("res://Assets/door_lock.tscn").instance()                                                                       
onready var prompt = $Prompt_Screen
onready var timer = $Timer
onready var points = $Points

var screen_size_x = 60
var screen_size_y = 90
var t_timer = 3
var t_start = 3
var t_end = 5
var start = false
var win = false

var rnd_x = 0.0
var rnd_y = 0.0
var hole_speed = 2 * GameController._MiniGame.Dificult

onready var progBar = $Timer/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.text = ''
	randomize()
	var rnd_x = rand_range(screen_size_x-40,screen_size_x)
	var rnd_y = rand_range(screen_size_y-40,screen_size_y)
	print(rnd_x)
	print(rnd_y)
	door_lock.position = Vector2(rnd_x,rnd_y)
	self.add_child(door_lock)
	door_lock.hide()

func _process(delta):
	if start:
		t_end -= delta
#		timer.text = str(t_end)

		progBar.value = t_end / 5 * 100

	if door_lock.click:
		Global.win = true
		next_scene()
	if t_end <= 0:
		Global.win = false
		next_scene()

func _on_door_lock_pressed():
	pass # Replace with function body.


func _on_t_door_lock_timeout():
	if start:
		door_lock.show()
		t_timer -= 1
		if door_lock.position.x > screen_size_x || door_lock.position.x < screen_size_x-40:
			rnd_x = -rnd_x
		if door_lock.position.y > screen_size_y || door_lock.position.y < screen_size_y-40:
			rnd_y = -rnd_y
		door_lock.translate( Vector2(rnd_x, rnd_y) )
			
		if !door_lock.click:
			if(t_timer <= 0):
				var rng = RandomNumberGenerator.new()
				rng.randomize()
				rnd_x = rng.randf_range(-hole_speed, hole_speed)
				rnd_y = rng.randf_range(-hole_speed, hole_speed)
				print(door_lock.position.x)
				print(door_lock.position.y)
				t_timer = 30
		

func _on_Start_Timer_timeout():
	t_start -= 1
	if t_start == 0:
		start = true
		prompt.hide()

func next_scene(): 
	get_tree().change_scene(minigame_end)
