extends Node2D

signal GAMEOVER

# MINIGAME BARMAN

const GameController = preload("res://Assets/GameController.tres")

#var timer = GameController._MiniGame.MiniGameTimer
#var difficult = GameController._MiniGame.Dificult
var timer = GameController._MiniGame.MiniGameTimer / GameController._MiniGame.Dificult
var difficult = 3
var points = 0
var minigame_end = "res://Scenes/Minigame_end.tscn"

onready var points_text = $Game/Points
onready var timer_text = $Game/Timer

onready var button = $Game/Button

onready var optA = $Game/OptionA
onready var optB = $Game/OptionB
onready var optC = $Game/OptionC
onready var aLab = $Game/Order

var answer = 0
var sorted = false

enum {BEER, VODKA, TEQUILA, WINE, RUM, ABSINT, SHOT}

func _process(delta):
	points_text.text = str(points)
	timer_text.text = str(timer)
	timer -= delta
	
	if timer > 0:
		game_loop(delta)
	else:
		points_text.text = "Record: " + str(points)
		timer_text.text = "GAME OVER"
		button.visible = true

func game_loop(l_delta):
	if sorted == false:
		sort_Value()

func _on_OptionA_pressed():
	if int(float(optA.text)) == answer:
		points += 1
	else:
		points -= 1
	sorted = false

func _on_OptionB_pressed():
	if int(float(optB.text)) == answer:
		points += 1
	else:
		points -= 1
	sorted = false

func _on_OptionC_pressed():
	if int(float(optC.text)) == answer:
		points += 1
	else:
		points -= 1
	sorted = false

func sort_Value():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var sort = rng.randi_range(BEER, SHOT)
	answer = sort
	var sort2 = sort
	while sort2 == sort:
		sort2 = rng.randi_range(BEER, SHOT)
	var sort3 = sort
	while sort3 == sort or sort3 == sort2:
		sort3 = rng.randi_range(BEER, SHOT)
	
	aLab.text = str(answer)
	sort_Answer(sort, sort2, sort3)
	sorted = true

func sort_Answer(answer, wrongA, wrongB):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var sort = rng.randi_range(1, 3)
	if sort == 1:
		optA.text = str(answer)
		optB.text = str(wrongA)
		optC.text = str(wrongB)
	elif sort == 2:
		optA.text = str(wrongA)
		optB.text = str(answer)
		optC.text = str(wrongB)
	elif sort == 3:
		optA.text = str(wrongB)
		optB.text = str(wrongA)
		optC.text = str(answer)


func _on_Button_pressed():
	GameController.Score += points
	get_tree().change_scene(minigame_end)
