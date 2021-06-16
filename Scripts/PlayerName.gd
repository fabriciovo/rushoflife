extends Node2D

const GameController = preload("res://Assets/GameController.tres")
var gameMenu = preload("res://Scenes/GameMenu.tscn")
var keySounds = ["res://Sounds/Teclado 1.wav","res://Sounds/Teclado 2.wav","res://Sounds/Teclado 3.wav"]
var btnSounds = ["res://Sounds/Clique Seleção 1.wav", "res://Sounds/Clique Seleção 2.wav", "res://Sounds/Clique Seleção 3.wav", "res://Sounds/Clique Seleção 4.wav"]
var clicked = false

onready var nameField = $Screen/NameField

func _ready():
	randomize()
	$Screen/NameField.grab_focus()

func _input(ev):
	if ev is InputEventKey and ev.pressed and ev.scancode != KEY_SPACE and !ev.is_echo():
		var index = int(round(rand_range(0,2)))
		$Screen/AudioStreamPlayer.stream = load(keySounds[index])
		$Screen/AudioStreamPlayer.play()
	elif ev is InputEventKey and ev.pressed and ev.scancode == KEY_SPACE and !ev.is_echo():
		$Screen/AudioStreamPlayer.stream = load("res://Sounds/Teclado Barra de Espaço.wav")
		$Screen/AudioStreamPlayer.play()

func _on_Button_pressed():
	if nameField.text.length() > 3 and !clicked:
		clicked = true
		var index = int(round(rand_range(0,3)))
		$Screen/AudioStreamPlayer.stream = load(btnSounds[index])
		$Screen/AudioStreamPlayer.play()
		$Screen/Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene_to(gameMenu)
	GameController._Player.set_Name(nameField.text)
