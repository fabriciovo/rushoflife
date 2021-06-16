extends Node2D

var minigame_end = "res://Scenes/Minigame_end.tscn"

onready var prompt = $Prompt_Screen
onready var current_score = $Points/Score/Score_Current
onready var score_timer = $Points/Score/Score_Timer
onready var timer = $Timer
onready var points = $Points
onready var ui_holder = $Game_Screen/UI_Holder

var score = 0
var start_Timer_CountDown = 3
var miniGame_Timer = 15
var difficulty = 2
var game_Over = false



#	TIRANDO O PROMPT INICIAL E O TIMER DA TELA
func Start_Game():
	prompt.queue_free()
	timer.show()
	points.show()
	ui_holder.show()
	$Game_Screen/GameTimer.start()
	timer.text = str(miniGame_Timer)
	$Game_Screen/PeeingGuy/PeeingGuySprite/Pee_Collision/CollisionShape2D.disabled = false
	randomize()
	$Game_Screen/PeeingGuy.angular_velocity = (rand_range(-difficulty, difficulty))

func End_Game():
	$Game_Screen/GameTimer.stop()
	game_Over = true
	$Game_Screen/PeeingGuy/PeeingGuySprite/Pee_Collision/CollisionShape2D.disabled = true
	$Game_Screen/PeeingGuy.angular_velocity = 0
	$Game_Screen/PeeingGuy.applied_torque = 0
	$Game_Screen/UI_Holder.queue_free()
	timer.text = "GAME OVER"
	Next_Scene()

func _on_Urinal_Collision_area_entered(area):
	if !game_Over:
		score_timer.start()

func _on_Urinal_Collision_area_exited(area):
	if !game_Over:
		score_timer.stop()

func _on_Score_Timer_timeout():
	if !game_Over:
		score += 2
		current_score.text = str(score)

#	ATUALIZANDO O TIMER INICIAL
func _on_Start_Timer_timeout():
	start_Timer_CountDown -= 1
	if start_Timer_CountDown <= 0:
		Start_Game()

func _on_GameTimer_timeout():
	miniGame_Timer -= 1
	timer.text = str(miniGame_Timer)
	if $Game_Screen/PeeingGuy.fallen == true:
		Global.win = false
		End_Game()
	if miniGame_Timer <= 0:
		Global.win = true
		End_Game()

	
func Next_Scene():
	get_tree().change_scene(minigame_end)


