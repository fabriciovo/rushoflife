extends Resource

class_name GameController

const _MiniGame = preload("res://Assets/MiniGameEntity.tres")
const _Player = preload("res://Assets/Player.tres")

export var Level = 0 setget set_Level
export var Stage = 0 setget set_Stage
export var Score = 0 setget set_Score
export var Life = 10 setget set_Life
export var Sanity = 5 setget set_Sanity
export var Money = 10 setget set_Money

var TransitionImage0: Texture
var TransitionImage1: Texture
var TransitionImage2: Texture

func set_Level(level):
	Level =  level

func set_Stage(stage):
	Stage = stage
	
func set_Sanity(sanity):
	Sanity = sanity
	
func set_Life(life):
	Life =  life
	
func set_Score(score):
	Score = score

func set_Money(money):
	Money = money

func EraseImages():
	TransitionImage0 = null
	TransitionImage1 = null
	TransitionImage2 = null
