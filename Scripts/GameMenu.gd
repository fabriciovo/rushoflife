extends Node2D

const gameController = preload("res://Assets/GameController.tres")
var minigame = preload("res://Scenes/MiniGame.tscn")

func _on_Next_pressed():
	pass # Replace with function body.


func _on_Back_pressed():
	pass # Replace with function body.


func _on_StartMiniGame_pressed():
	print(gameController.Level)
	gameController.Level += 1
	print(gameController.Level)
	get_tree().change_scene_to(minigame)
