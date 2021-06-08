extends Node2D

const GameController = preload("res://Assets/GameController.tres")

onready var phase1 = $Control/PanelA/Phase
onready var phase2 = $Control/PanelB/Phase
onready var phase3 = $Control/PanelC/Phase

func _ready():
	prepare_Phase(phase1, 0, GameController.Level, GameController.TransitionImage0)
	prepare_Phase(phase2, 1, GameController.Level, GameController.TransitionImage1)
	prepare_Phase(phase3, 2, GameController.Level, GameController.TransitionImage2)
	
	if GameController.Level == 3:
		GameController.EraseImages()
		get_node("Control/Button").text = "Finish"

func _on_Button_pressed():
	GameController.Level += 1
	print(GameController.Level)
	print(GameController.Score)
	
	get_tree().change_scene("res://Scenes/MiniGame.tscn")

func prepare_Phase(phase: Sprite, phaseNumber:int, level: int, gcImage: Texture):
	if phaseNumber == level:
		phase.modulate = Color(1, 1, 1)
		pass
	else:
		phase.modulate = Color(0.2, 0.2, 0.2)
		pass
	
	if gcImage != null:
		phase.texture = gcImage
		var size = phase.texture.get_size()
		phase.scale = Vector2(25 / size.x, 25 / size.y * -1)
		pass
