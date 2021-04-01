extends Node2D

const MiniGameEntity = preload("res://MiniGameEntity.tres")

onready var minigameName = $UI/MinigameName
onready var timer = $"UI/Timer(provisorio)"


func _ready():
#	minigameName.text = MiniGameEntity.Name
#	timer = MiniGameEntity.MiniGameTimer
#	print(MiniGameEntity.Name)
	match  MiniGameEntity.Type:
		0:
			Poster()
		1:
			OutroMinigame()
		


func Poster():
	var teste = preload("res://PosterMaker.tscn")
	get_tree().change_scene_to(teste)
	

func OutroMinigame():
	pass
