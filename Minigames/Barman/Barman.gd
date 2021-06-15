extends Node2D

signal GAMEOVER

# MINIGAME BARMAN

const GameController = preload("res://Assets/GameController.tres")

var timer = GameController._MiniGame.MiniGameTimer / GameController._MiniGame.Dificult
var points = 0
var minigame_end = "res://Scenes/PartyTransition.tscn"

onready var points_text = $Game/Points
onready var timer_text = $Game/Timer

onready var button = $Game/Button

onready var optA = [$Game/OptionA, 0]
onready var optB = [$Game/OptionB, 0]
onready var optC = [$Game/OptionC, 0]
onready var aLab = $Game/Panel/Order

var answer = 0
var sorted = false

enum {BEER, VODKA, TEQUILA, WINE, RUM, ABSINT}

var drinks: Array

var start_Timer_CountDown = 4
var GameStart = false

func _ready():
	$Game.visible = false
	$Prompt_Screen/Prompt.text = "Serve the\ndrinks\ncorrectly"
	optA[0].expand_icon = true
	optB[0].expand_icon = true
	optC[0].expand_icon = true
	load_Drinks()
	button.visible = false

func _process(delta):
	if GameStart:
		points_text.text = str(points)
		timer_text.text = str(timer)
		timer -= delta
		
		if timer > 0:
			game_loop(delta)
		else:
			disable()
			points_text.text = "Record: " + str(points)
			GameController.Score += points
			timer_text.text = "GAME OVER"
			button.visible = true

func game_loop(l_delta):
	if sorted == false:
		sort_Value()
		assign_Imgs()

func _on_OptionA_pressed():
	if optA[1] == answer:
		points += 1
	else:
		points -= 1
	sorted = false

func _on_OptionB_pressed():
	if optB[1] == answer:
		points += 1
	else:
		points -= 1
	sorted = false

func _on_OptionC_pressed():
	if optC[1] == answer:
		points += 1
	else:
		points -= 1
	sorted = false

func sort_Value():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var sort = rng.randi_range(BEER, ABSINT)
	answer = sort
	var sort2 = sort
	while sort2 == sort:
		sort2 = rng.randi_range(BEER, ABSINT)
	var sort3 = sort
	while sort3 == sort or sort3 == sort2:
		sort3 = rng.randi_range(BEER, ABSINT)
	
	aLab.texture = drinks[answer]
	sort_Answer(sort, sort2, sort3)
	sorted = true

func sort_Answer(answer, wrongA, wrongB):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var sort = rng.randi_range(1, 3)
	if sort == 1:
		optA[1] = answer
		optB[1] = wrongA
		optC[1] = wrongB
	elif sort == 2:
		optA[1] = wrongA
		optB[1] = answer
		optC[1] = wrongB
	elif sort == 3:
		optA[1] = wrongB
		optB[1] = wrongA
		optC[1] = answer

func _on_Button_pressed():
	NextScene()

func load_Drinks():
	var beer = load("res://Minigames/Barman/Images/Drinks/Beer.png")
	var coke = load("res://Minigames/Barman/Images/Drinks/Coke.png")
	var shot = load("res://Minigames/Barman/Images/Drinks/Shot.png")
	var tequila = load("res://Minigames/Barman/Images/Drinks/Tequila.png")
	var whater = load("res://Minigames/Barman/Images/Drinks/Whater.png")
	var whine = load("res://Minigames/Barman/Images/Drinks/Whine.png")
	drinks.append(beer)
	drinks.append(coke)
	drinks.append(shot)
	drinks.append(tequila)
	drinks.append(whater)
	drinks.append(whine)

func assign_Imgs():
	optA[0].icon = drinks[optA[1]]
	optB[0].icon = drinks[optB[1]]
	optC[0].icon = drinks[optC[1]]

func disable():
	optA[0].disabled = true
	optB[0].disabled = true
	optC[0].disabled = true

func _on_Start_Timer_timeout():
	start_Timer_CountDown -= 1
	$Prompt_Screen/Start_Count_Down.text = str(start_Timer_CountDown)
	
	if start_Timer_CountDown <= 0:
		GameStart = true
		$Game.visible = true
		$Prompt_Screen.visible = false

func NextScene():
	var img = get_viewport().get_texture().get_data()
	yield(get_tree(), "idle_frame")
	var tex = ImageTexture.new()
	tex.create_from_image(img)

	if GameController.Level == 1:
		GameController.TransitionImage0 = tex
	elif GameController.Level == 2:
		GameController.TransitionImage1 = tex
	elif GameController.Level == 3:
		GameController.TransitionImage2 = tex

	GameController.Score += points	
	get_tree().change_scene(minigame_end)
