extends Node

onready var pong = $Player/Pong
onready var count_down_text = $Prompt_Screen/Start_Timer
onready var pong_focrce_text = $Timer2/pong_force
onready var prompt = $Prompt_Screen
var minigame_end = "res://Scenes/PartyTransition.tscn"

var start_Timer_CountDown = 3
var difficulty = 5
var start = false
var game_CountDown = 5
var mouse_pressed = false

func _process(delta):
		pong.checkVelocity() 
		print(pong.velocity)


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
		#Next_Scene()
		pass

func _on_Start_Timer_timeout():
		start_Timer_CountDown -= 1
		if start_Timer_CountDown == 0:
			prompt.hide()
			start = true
			pong.acceleration()



func Next_Scene():
	get_tree().change_scene(minigame_end)

func _on_pong_timer_timeout():
	pong_focrce_text.text = "strength: " + str(pong.acc)
