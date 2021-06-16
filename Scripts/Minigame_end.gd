extends Node2D

const GameController = preload("res://Assets/GameController.tres")
var party_transition = "res://Scenes/PartyTransition.tscn"
onready var icon_pane_win = $Node2D/icon_panel/win
onready var icon_pane_lose = $Node2D/icon_panel/lose

onready var status_panel_life = $Node2D/status_panel/life
onready var status_panel_sanity = $Node2D/status_panel/sanity
onready var status_panel_money = $Node2D/status_panel/money

func _ready():
	if Global.win == true:
		icon_pane_win.show()
		GameController.Money += 2
		if GameController.Level == 1:
			status_panel_life.text = "Life: 0"
			status_panel_sanity.text = "Sanity: 0"
			status_panel_money.text = "Money: + 2"
		if GameController.Level == 2:
			status_panel_life.text = "Life: 0"
			status_panel_sanity.text = "Sanity: 0"
			status_panel_money.text = "Money: + 3"
		if GameController.Level == 3:
			status_panel_life.text = "Life: 0"
			status_panel_sanity.text = "Sanity: 0"
			status_panel_money.text = "Money: + 4"
		
		
	else:
		icon_pane_lose.show()
		if GameController.Level == 1:
			GameController.Life -= 1
			GameController.Money -= 1
			status_panel_life.text = "Life: - 1"
			status_panel_sanity.text = "Sanity: 0"
			status_panel_money.text = "Money: - 1"
		if GameController.Level == 2:
			GameController.Sanity -= 1
			GameController.Money -= 2
			status_panel_life.text = "Life: 0"
			status_panel_sanity.text = "Sanity: - 1"
			status_panel_money.text = "Money: - 2"
		if GameController.Level == 3:
			GameController.Life -= 1
			GameController.Sanity -= 1
			GameController.Money -= 3
			status_panel_life.text = "Life: - 1"
			status_panel_sanity.text = "Sanity: - 1"
			status_panel_money.text = "Money: - 3"
		


func _on_Button_pressed():
		get_tree().change_scene(party_transition)
