extends Node2D
const GameController = preload("res://Assets/GameController.tres")
var game_menu = load("res://Scenes/GameMenu.tscn")

onready var txt_desc = $Game/Description
onready var life = $Game/player_stats/life
onready var money = $Game/player_stats/money
onready var sanity = $Game/player_stats/sanity
var price = 0
var text = ""

func _ready():
	life.text = "Life: " + str(GameController.Life)
	money.text = "$: " + str(GameController.Money)
	sanity.text = "Sanity: " + str(GameController.Sanity)

	


func _on_OptionA_mouse_entered():
	price = 5
	txt_desc.text = "Recover 5 of Life " + "$: " + str(price)
	
	


func _on_OptionB_mouse_entered():
	price = 10
	txt_desc.text = "Recover 10 of Life " + "$: " + str(price)

	


func _on_OptionC_mouse_entered():
	price = 5
	txt_desc.text = "Recover 5 of Sanity " + "$: " + str(price)

	


func _on_OptionA_pressed():
	pass # Replace with function body.


func _on_OptionB_pressed():
	pass # Replace with function body.


func _on_OptionC_pressed():
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene_to(game_menu)
