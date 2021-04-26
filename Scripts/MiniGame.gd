extends Node2D

const GameController = preload("res://Assets/GameController.tres")

func _ready():
	Game_Loop()

func Reset():
	GameController.Level = 0
	GameController.Stage = 0

func Game_Loop():
	
	if(GameController.Stage == 0):
		#start
		Game_Menu()
	if(GameController.Stage == 1):
		match GameController.Level:
			0:
				Poster_Posting()
			1:
				Barman()
			2: 
				Poster_Posting()
			3:
				Game_Menu()
	if(GameController.Stage == 2):
		match GameController.Level:
			0:
				Poster_Posting()
			1:
				Barman()
			2: 
				Poster_Posting()
			3:
				Game_Menu()
	if(GameController.Stage == 3):
		match GameController.Level:
			0:
				Poster_Posting()
			1:
				Barman()
			2: 
				Poster_Posting()
			3:
				Game_Menu()
	if(GameController.Stage ==4):
		Reset()
		Game_Menu()
	

func Poster_Maker():
	get_tree().change_scene("res://Minigames/Poster_Maker/PosterMaker.tscn")

func Poster_Posting():
	get_tree().change_scene("res://Minigames/Poster_Posting/Poster_Posting.tscn")

func Barman():
	get_tree().change_scene("res://Minigames/Barman/Barman.tscn")

func Game_Menu():
	var game_menu = "res://Scenes/GameMenu.tscn"
	get_tree().change_scene(game_menu)


