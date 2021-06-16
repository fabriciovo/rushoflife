extends Node2D

var mainMenu = load("res://Scenes/MainMenu.tscn")

func _on_Back_pressed():
	$Screen/AudioStreamPlayer.play()
	$Screen/Timer.start()


func _on_Timer_timeout():
	get_tree().change_scene_to(mainMenu)
	pass # Replace with function body.
