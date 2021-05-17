extends Resource

class_name GameController

const _MiniGame = preload("res://Assets/MiniGameEntity.tres")
const _Player = preload("res://Assets/Player.tres")

export var Level = 0 setget set_Level
export var Stage = 0 setget set_Stage
export var Score = 0

var TransitionImage0: Texture
var TransitionImage1: Texture
var TransitionImage2: Texture

func set_Level(level):
	Level =  level

func set_Stage(stage):
	Stage =  stage
