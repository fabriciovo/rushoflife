extends Node2D

const GameController = preload("res://Assets/GameController.tres")
#var minigame = preload("res://Scenes/MiniGame.tscn")
var minigame = preload("res://Scenes/PartyTransition.tscn")
var shop = preload("res://Scenes/Shop.tscn")



onready var score = $Screen/score_board/score
onready var life = $Screen/score_board/life
onready var sanity = $Screen/score_board/sanity
onready var money = $Screen/score_board/money
onready var label_name = $Screen/score_board/name



func _ready():
	GameController.Level = 0
	score.text = "Score: " + str(GameController.Score) 
	label_name.text = "Name: " + GameController._Player.Name
	life.text = "Life: " + str(GameController.Life)
	sanity.text = "Sanity: " + str(GameController.Sanity)
	money.text = "$: " + str(GameController.Money)


func _on_StartMiniGame_pressed():
	GameController.Stage += 1
	GameController._MiniGame.set_Timer(10.0)
	GameController._MiniGame.set_Dificult(1)
	print(GameController.Stage)
#	GameController.test += 1
#	print(GameController.test)
	get_tree().change_scene_to(minigame)


func _on_go_to_shop_pressed():
	get_tree().change_scene_to(shop)
