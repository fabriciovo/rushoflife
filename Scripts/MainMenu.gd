extends Node2D

const GameController = preload("res://Assets/GameController.tres")
var playerName = preload("res://Scenes/PlayerName.tscn")
var credits = preload("res://Scenes/Credits.tscn")
var sceneToLoad = null;
var clicked = false

func _on_StartGame_pressed():
	if(!clicked):
		$Screen/AudioStreamPlayer.play()
		$Screen/Timer.start()
		clicked = true
		sceneToLoad = playerName

func _on_Credits_pressed():
	if(clicked): return
	$Screen/AudioStreamPlayer.play()
	$Screen/Timer.start()
	clicked = true
	sceneToLoad = credits

func _on_Options_pressed():
	$Screen/AudioStreamPlayer.play()

func _on_Timer_timeout():
	get_tree().change_scene_to(sceneToLoad)
