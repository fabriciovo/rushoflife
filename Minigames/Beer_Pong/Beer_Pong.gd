extends Node

onready var pong = $Player/Pong
onready var count_down_text = $Prompt_Screen/Start_Timer
onready var pong_focrce_text = $Timer2/pong_force
onready var prompt = $Prompt_Screen
onready var timer = $Timer2
onready var points = $Points
onready var b_next_minigame = $NextMinigame
var minigame_end = "res://Scenes/Minigame_end.tscn"

var start_Timer_CountDown = 3
var difficulty = 5
var start = false
var game_CountDown = 5
var mouse_pressed = false

func _process(delta):
		pong.checkVelocity() 
		if pong.velocity_zero:
			Global.win = false
			Next_Scene()


func _input(event): 
	if start:
		if event is InputEventMouseButton and start == true:
			if event.button_index == BUTTON_LEFT and event.pressed :
				#pong.launch(50)
				pong.launch()
				pong.start = false
				start = false
				pong.end_pong = true
				print("Mouse Click/Unclick at: ", event.position)

func _on_Timer_timeout():
	game_CountDown -= 1
	if game_CountDown <= 0:
		start = false
		b_next_minigame.show()

func _on_Start_Timer_timeout():
		start_Timer_CountDown -= 1
		if start_Timer_CountDown == 0:
			prompt.hide()
			points.show()
			timer.show()
			start = true
			pong.acceleration()



func Next_Scene():
	get_tree().change_scene(minigame_end)

func _on_pong_timer_timeout():
	pong_focrce_text.text = "strength: " + str(pong.acc)


func _on_NextMinigame_pressed():
	$AudioStreamPlayer.play()


func _on_AudioStreamPlayer_finished():
	Next_Scene()


func _on_Ball_area_body_entered(body):
	if body.name == "Pong":
		Global.win = true
		Next_Scene()
