extends Node2D

const GameController = preload("res://Assets/GameController.tres")

onready var phase1 = $Control/Phase1
onready var phase2 = $Control/Phase2
onready var phase3 = $Control/Phase3

func _ready():
#	phase1.modulate = Color(0.2,0.2,0.2)
#	phase2.modulate = Color(0.2,0.2,0.2)
#	phase3.modulate = Color(0.2,0.2,0.2)
#
#	if GameController.Level == 0:
#		phase1.modulate = Color(1,1,1)
#	elif GameController.Level == 1:
#		phase1.texture = GameController.TransitionImage0
#		set_Phase_Image(phase1)
#		phase2.modulate = Color(1,1,1)
#	elif GameController.Level == 2:
#		phase1.texture = GameController.TransitionImage0
#		set_Phase_Image(phase1)
#		phase3.modulate = Color(1,1,1)
	prepare_Phase(phase1, 0, GameController.Level, GameController.TransitionImage0)
	prepare_Phase(phase2, 1, GameController.Level, GameController.TransitionImage1)
	prepare_Phase(phase3, 2, GameController.Level, GameController.TransitionImage2)
	
	if GameController.Level == 3:
		get_node("Control/Button").text = "Finish"

func _on_Button_pressed():
	GameController.Level += 1
	print(GameController.Level)
	print(GameController.Score)
	
	get_tree().change_scene("res://Scenes/MiniGame.tscn")

func prepare_Phase(phase: Sprite, phaseNumber:int, level: int, gcImage: Texture):
	if phaseNumber == level:
		phase.modulate = Color(1, 1, 1)
	else:
		phase.modulate = Color(0.2, 0.2, 0.2)
	
	if gcImage != null:
		phase.texture = gcImage
		var size = phase.texture.get_size()
		phase.scale = Vector2(40 / size.x, 40 / size.y * -1)
