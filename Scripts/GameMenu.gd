extends Node2D

const GameController = preload("res://Assets/GameController.tres")
#var minigame = preload("res://Scenes/MiniGame.tscn")
var minigame = preload("res://Scenes/PartyTransition.tscn")
var shop = preload("res://Scenes/Shop.tscn")
var btnSounds = ["res://Sounds/Clique Seleção 1.wav", "res://Sounds/Clique Seleção 2.wav", "res://Sounds/Clique Seleção 3.wav", "res://Sounds/Clique Seleção 4.wav"]
var sceneToLoad = null
var clicked = false

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
	randomize()


func _on_StartMiniGame_pressed():
	if !clicked:
		GameController.Stage += 1
		GameController._MiniGame.set_Timer(10.0)
		GameController._MiniGame.set_Dificult(1)
		print(GameController.Stage)
	#	GameController.test += 1
	#	print(GameController.test)
		sceneToLoad = minigame
		$Screen/Timer.start()
		clicked = true
		var index = int(round(rand_range(0,3)))
		$Screen/AudioStreamPlayer.stream = load(btnSounds[index])
		$Screen/AudioStreamPlayer.play()
	


func _on_go_to_shop_pressed():
	if !clicked:
		sceneToLoad = shop
		$Screen/Timer.start()
		clicked = true
		var index = int(round(rand_range(0,3)))
		$Screen/AudioStreamPlayer.stream = load(btnSounds[index])
		$Screen/AudioStreamPlayer.play()


func _on_Timer_timeout():
	get_tree().change_scene_to(sceneToLoad)


func _on_Options_pressed():
	$Screen/AudioStreamPlayer.stream = load("res://Sounds/Clique Ponto no Mapa.wav")
	$Screen/AudioStreamPlayer.play()


func _on_Album_pressed():
	$Screen/AudioStreamPlayer.stream = load("res://Sounds/Clique Ponto no Mapa.wav")
	$Screen/AudioStreamPlayer.play()
