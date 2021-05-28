extends Node

onready var pong = $Player/Pong
onready var count_down_text = $Prompt_Screen/Start_Count_Down
onready var pong_focrce_text = $Prompt_Screen/pong_force
var minigame_end = "res://Scenes/PartyTransition.tscn"

var start_Timer_CountDown = 3
var difficulty = 5
var start = false
var game_CountDown = 5
var mouse_pressed = false

func _input(event): 
	if start:
		if event is InputEventMouseButton and start == true:
			if event.button_index == BUTTON_LEFT and event.pressed :
				#pong.launch(50)
				pong.acceleration()
				print("Mouse Click/Unclick at: ", event.position)
			if event.button_index == BUTTON_LEFT and not event.pressed:
				pong.start = false
				pong.launch()
				start = false

func _on_Timer_timeout():
	game_CountDown -= 1
	if game_CountDown <= 0:
		Next_Scene()

func _on_Start_Timer_timeout():
		start_Timer_CountDown -= 1
		count_down_text.text = str(start_Timer_CountDown)
		if start_Timer_CountDown == 0:
			start = true
			count_down_text.text = str("START!")
		if start_Timer_CountDown == -1:
				count_down_text.hide()


func Next_Scene():
	get_tree().change_scene(minigame_end)

func _on_pong_timer_timeout():
	pong_focrce_text.text = "force: " + str(pong.acc)
