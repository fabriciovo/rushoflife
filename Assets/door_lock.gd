extends Node2D


var minigame_end = "res://Scenes/PartyTransition.tscn"

func _on_door_lock_pressed():
	NextScene()


func NextScene():
	get_tree().change_scene(minigame_end)
