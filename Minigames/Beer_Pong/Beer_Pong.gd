extends Node

onready var pong = $Player/Pong
onready var count_down_text = $Prompt_Screen/Start_Count_Down
var minigame_end = "res://Scenes/PartyTransition.tscn"

var start_Timer_CountDown = 3
var difficulty = 5
var start = false
var game_CountDown = 5


func _input(event): 
	if start:
		if event is InputEventMouseButton:
			pong.launch(50)
			print("Mouse Click/Unclick at: ", event.position)


func _on_Timer_timeout():
	game_CountDown -= 1
	if game_CountDown <= 0:
		Next_Scene()

func _on_Start_Timer_timeout():
		start_Timer_CountDown -= 1
		count_down_text.text = str(start_Timer_CountDown)
		if start_Timer_CountDown <= 0:
			count_down_text.text = str("START!")
			start = true


func Next_Scene():
	get_tree().change_scene(minigame_end)
