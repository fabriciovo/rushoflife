extends Node2D

const MiniGameEntity = preload("res://MiniGameEntity.tres")

var minigame = preload("res://MiniGame.tscn")

func _ready():
	SetMiniGame("KKKKK", 20, 1, 0)


func _on_Button_pressed():
	get_tree().change_scene_to(minigame)


func SetMiniGame(name, timer, dificult, type):
	MiniGameEntity.Name = name
	MiniGameEntity.MiniGameTimer = timer
	MiniGameEntity.Dificult = dificult
	MiniGameEntity.Type = type
