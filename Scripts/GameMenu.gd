extends Node2D

const GameController = preload("res://Assets/GameController.tres")
#var minigame = preload("res://Scenes/MiniGame.tscn")
var minigame = preload("res://Scenes/PartyTransition.tscn")

onready var scoreBoard = $Screen/ScoreBoard

func _ready():
	GameController.Level = 0
	scoreBoard.text = "Score: " + str(GameController.Score) + '\n' + GameController._Player.Name + '\n' + str(GameController.Stage)

func _on_StartMiniGame_pressed():
	GameController.Stage += 1
	GameController._MiniGame.set_Timer(10.0)
	GameController._MiniGame.set_Dificult(1)
	print(GameController.Stage)
#	GameController.test += 1
#	print(GameController.test)
	get_tree().change_scene_to(minigame)
