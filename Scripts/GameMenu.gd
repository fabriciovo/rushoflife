extends Node2D

const GameController = preload("res://Assets/GameController.tres")
var minigame = preload("res://Scenes/MiniGame.tscn")
	
func _on_Next_pressed():
	pass # Replace with function body.

func _on_Back_pressed():
	pass # Replace with function body.

func _on_StartMiniGame_pressed():
	GameController.Stage += 1
	GameController._MiniGame.set_Timer(30.0)
	GameController._MiniGame.set_Dificult(1)
	print(GameController.Stage)
#	GameController.test += 1
#	print(GameController.test)
	get_tree().change_scene_to(minigame)

func _ready():
	GameController.Level = 0
