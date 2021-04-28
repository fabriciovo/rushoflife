extends Node2D

var minigame_end = "res://Scenes/PartyTransition.tscn"

var score = 0
var max_Score = 100
var start_Timer_CountDown = 3
var miniGame_Timer = 15
var difficulty = 2
var game_Over = false

#	TIRANDO O PROMPT INICIAL E O TIMER DA TELA
func Start_Game():
	$Prompt_Screen.queue_free()
	$Game_Screen/UI_Holder.show()
	$Game_Screen/GameTimer.start()
	$Game_Screen/UI_Holder/Timer.text = str(miniGame_Timer)
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
	$End_Screen.show()
	
	if score >= max_Score:
		$End_Screen/End_Message.text = "Parabens! Voce Conseguiu"
	else:
		$End_Screen/End_Message.text = "Voce falhou!"
	
	$End_Screen/End_Points.text = str(score) + "/" + str(max_Score)
	Next_Scene()

func _on_Urinal_Collision_area_entered(area):
	if !game_Over:
		$Game_Screen/UI_Holder/Score/Score_Timer.start()

func _on_Urinal_Collision_area_exited(area):
	if !game_Over:
		$Game_Screen/UI_Holder/Score/Score_Timer.stop()

func _on_Score_Timer_timeout():
	score += 2
	$Game_Screen/UI_Holder/Score/Score_Current.text = str(score)

#	ATUALIZANDO O TIMER INICIAL
func _on_Start_Timer_timeout():
	start_Timer_CountDown -= 1
	$Prompt_Screen/Start_CountDown.text = str(start_Timer_CountDown)
	
	if start_Timer_CountDown <= 0:
		Start_Game()

func _on_GameTimer_timeout():
	miniGame_Timer -= 1
	
	if $Game_Screen/PeeingGuy.fallen == true:
		End_Game()
	
	$Game_Screen/UI_Holder/Timer.text = str(miniGame_Timer)
	
	if miniGame_Timer <= 0:
		End_Game()

	
func Next_Scene():
	get_tree().change_scene(minigame_end)

