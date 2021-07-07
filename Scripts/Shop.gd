extends Node2D
const GameController = preload("res://Assets/GameController.tres")
var game_menu = load("res://Scenes/GameMenu.tscn")

onready var txt_desc = $Game/Description
onready var life = $Game/player_stats/life
onready var money = $Game/player_stats/money
onready var sanity = $Game/player_stats/sanity
var price = 0
var text = ""
var clicked = false

func _ready():
	life.text = "Life: " + str(GameController.Life)
	money.text = "$: " + str(GameController.Money)
	sanity.text = "Sanity: " + str(GameController.Sanity)

func _process(delta):
	life.text = "Life: " + str(GameController.Life)
	money.text = "$: " + str(GameController.Money)
	sanity.text = "Sanity: " + str(GameController.Sanity)


func _on_OptionA_mouse_entered():
	price = 5
	txt_desc.text = "Recover 5 Life " + "$: " + str(price)
	
	


func _on_OptionB_mouse_entered():
	price = 10
	txt_desc.text = "Recover 10 Life " + "$: " + str(price)

	


func _on_OptionC_mouse_entered():
	price = 5
	txt_desc.text = "Recover 5 Sanity " + "$: " + str(price)

	


func _on_OptionA_pressed():
	$AudioStreamPlayer.pitch_scale = 2
	$AudioStreamPlayer.play()
	if(GameController.Money > 5 && GameController.Life < 10):
		GameController.Life += price
		GameController.Money -= price
		if(GameController.Life >= 10):
			GameController.Life = 10
	pass # Replace with function body.


func _on_OptionB_pressed():
	$AudioStreamPlayer.pitch_scale = 2
	$AudioStreamPlayer.play()
	if(GameController.Money > 10 && GameController.Life < 10):
		GameController.Life += price
		GameController.Money -= price
		if(GameController.Life >= 10):
			GameController.Life = 10
	pass # Replace with function body.


func _on_OptionC_pressed():
	$AudioStreamPlayer.pitch_scale = 2
	$AudioStreamPlayer.play()
	if(GameController.Money > 5 && GameController.Sanity < 5):
		GameController.Sanity += price
		GameController.Money -= price
		if(GameController.Sanity >= 5):
			GameController.Sanity = 5
	pass # Replace with function body.


func _on_Button_pressed():
	if !clicked:
		$Timer.start()
		$AudioStreamPlayer.pitch_scale = 1.5
		$AudioStreamPlayer.play()
		clicked = true


func _on_Timer_timeout():
	get_tree().change_scene_to(game_menu)
