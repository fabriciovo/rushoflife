extends Node2D

var playerName = preload("res://Scenes/PlayerName.tscn")

func _on_StartGame_pressed():
	get_tree().change_scene_to(playerName)
