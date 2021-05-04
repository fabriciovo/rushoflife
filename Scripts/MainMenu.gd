extends Node2D

const GameController = preload("res://Assets/GameController.tres")
var playerName = preload("res://Scenes/PlayerName.tscn")
var credits = preload("res://Scenes/Credits.tscn")

func _on_StartGame_pressed():
	get_tree().change_scene_to(playerName)

func _on_Credits_pressed():
	get_tree().change_scene_to(credits)
	
