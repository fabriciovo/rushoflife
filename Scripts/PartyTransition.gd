extends Node2D

const GameController = preload("res://Assets/GameController.tres")

onready var phase1 = $Control/Phase1
onready var phase2 = $Control/Phase2
onready var phase3 = $Control/Phase3

func _ready():
	phase1.modulate = Color(0.2,0.2,0.2)
	phase2.modulate = Color(0.2,0.2,0.2)
	phase3.modulate = Color(0.2,0.2,0.2)
	if GameController.Level == 0:
		phase1.modulate = Color(1,1,1)
	elif GameController.Level == 1:
		phase2.modulate = Color(1,1,1)
	elif GameController.Level == 2:
		phase3.modulate = Color(1,1,1)
	
	if GameController.Level == 3:
		get_node("Control/Button").text = "Finish"

func _on_Button_pressed():
	GameController.Level += 1
	print(GameController.Level)
	print(GameController.Score)
	
	get_tree().change_scene("res://Scenes/MiniGame.tscn")
