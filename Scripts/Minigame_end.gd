extends Node2D

const gameController = preload("res://Assets/GameController.tres")


func _on_Button_pressed():
	print(gameController.Level)
	gameController.Level += 1
	print(gameController.Level)
	if(gameController.Level > 2):
		gameController.Level = 0
	get_tree().change_scene("res://Scenes/MiniGame.tscn")
