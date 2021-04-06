extends Resource

class_name MiniGameEntity

#export(String) var Name = ""
export var MiniGameTimer = 5.0 setget set_Timer
export var Dificult = 1 setget set_Dificult
export var Type = 0

func set_Timer(timer):
	MiniGameTimer = timer

func set_Dificult(dificult):
	Dificult = dificult
