extends Node2D

signal GAMEOVER

# MINIGAME POSTER_POSTING

const GameController = preload("res://Assets/GameController.tres")

var timer = GameController._MiniGame.MiniGameTimer
var difficult = GameController._MiniGame.Dificult
var points = 0
var minigame_end = "res://Scenes/PartyTransition.tscn"

onready var points_text = $Game/Points
onready var timer_text = $Game/Timer

onready var pole = $Game/Pole
onready var pole_collider = $Game/Pole/Area2D/CollisionShape2D

var pole_distance = 0.0
var pole_speedx = 24.0
var rng = RandomNumberGenerator.new()
var direction = 0

onready var button = $Game/AnimationPlayer/Button


# Called when the node enters the scene tree for the first time.
func _ready():
	direction = rng.randi_range(0, 1)
	button.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	points_text.text = str(points)
	timer_text.text = str(timer)
	timer -= delta
	
	if timer > 0:
		game_loop(delta)
	else:
		points_text.text = "Record: " + str(points)
		timer_text.text = "GAME OVER"
		button.visible = true

func _on_Pole_CLICKED(status):
	if status == "C":
		points += 1
	pass # Replace with function body.

func game_loop(l_delta):
#
#	if pole_distance < 5:
#		pole_distance += pole_speedy * l_delta * difficult
#		if pole_distance >= 3 and pole_distance <= 4:
#			pole_collider.disabled = false
#		else:
#			pole_collider.disabled = true
#	elif pole_distance >= 5:
#		pole_distance = 0
#		pole.position.x = 45
#		direction = rng.randi_range(0, 1)
#
#	var l_scale = (pole_distance / 5)
#	pole.scale = Vector2(1 * l_scale, 1 * l_scale)
	pole.position.x -= pole_speedx * l_delta * difficult
	if pole.position.x < 40 and pole.position.x > 20:
		pole_collider.disabled = false
	else:
		pole_collider.disabled = true
	
	if pole.position.x <= -10:
#		pole_distance = 25
		pole.position.x = 100

func _on_Button_pressed():
	Next_Scene()
	

	
func Next_Scene():

	var img = get_viewport().get_texture().get_data()
	yield(get_tree(), "idle_frame")
	var tex = ImageTexture.new()
	tex.create_from_image(img)

	if GameController.Level == 1:
		GameController.TransitionImage0 = tex
	elif GameController.Level == 2:
		GameController.TransitionImage1 = tex
	elif GameController.Level == 3:
		GameController.TransitionImage2 = tex

	GameController.Score += points	
	get_tree().change_scene(minigame_end)
