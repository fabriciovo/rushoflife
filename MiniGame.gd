extends Node2D

const MiniGameEntity = preload("res://MiniGameEntity.tres")

onready var minigameName = $UI/MinigameName
onready var timer = $"UI/Timer(provisorio)"


func _ready():
	minigameName.text = MiniGameEntity.Name
	timer = MiniGameEntity.MiniGameTimer
	print(MiniGameEntity.Name)
