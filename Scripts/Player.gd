extends Resource

class_name Player

export(String) var Name = ""
export(int)var Money = 0
export(int)var Life = 3
export(int)var Sanity = 0

func set_Name(name):
	Name = name
