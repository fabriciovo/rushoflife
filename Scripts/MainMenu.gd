extends Node2D

var gameMenu = preload("res://Scenes/GameMenu.tscn")

func _on_StartGame_pressed():
	get_tree().change_scene_to(gameMenu)
