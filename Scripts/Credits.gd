extends Node2D

var mainMenu = load("res://Scenes/MainMenu.tscn")

func _on_Back_pressed():
	get_tree().change_scene_to(mainMenu)
