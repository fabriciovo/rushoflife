extends Node2D

const gameController = preload("res://Assets/GameController.tres")

func _ready():
	match  gameController.Level:
		0:
			Game_Menu()
		1:
			Poster_Posting()
		2:
			Poster_Maker()

func Poster_Maker():
	var poster_maker = preload("res://Minigames/Poster_Maker/PosterMaker.tscn")
	get_tree().change_scene_to(poster_maker)

func Poster_Posting():
	var poster_posting = preload("res://Minigames/Poster_Posting/Poster_Posting.tscn")
	get_tree().change_scene_to(poster_posting)
	
func Game_Menu():
	var game_menu = "res://Scenes/GameMenu.tscn"
	get_tree().change_scene(game_menu)


