extends Node2D


const GameController = preload("res://Assets/GameController.tres")

func _on_Button_pressed():

	GameController.Level += 1
	print(GameController.Level)
	
	get_tree().change_scene("res://Scenes/MiniGame.tscn")
