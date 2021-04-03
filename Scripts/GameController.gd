extends Resource

class_name GameController

const _MiniGame = preload("res://Assets/MiniGameEntity.tres")
const _Player = preload("res://Assets/Player.tres")

onready var Level = 0 setget set_Level 
onready var Stage = 0 setget set_Stage
onready var Score = 0

func set_Level(level):
	Level =  level
	
func set_Stage(stage):
	Stage =  stage
