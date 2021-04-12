extends Node2D

const GameController = preload("res://Assets/GameController.tres")
var gameMenu = preload("res://Scenes/GameMenu.tscn")

onready var nameField = $Screen/NameField

func _on_Button_pressed():
	if nameField.text.length() > 3:
		GameController._Player.set_Name(nameField.text)
		get_tree().change_scene_to(gameMenu)
