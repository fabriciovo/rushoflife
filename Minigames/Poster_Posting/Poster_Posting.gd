extends Node2D

signal GAMEOVER

# MINIGAME POSTER_POSTING

const GameController = preload("res://Assets/GameController.tres")

var timer = GameController._MiniGame.MiniGameTimer
var difficult = GameController._MiniGame.Dificult
var points = 0
var minigame_end = "res://Scenes/Minigame_end.tscn"

onready var points_text = $Game/Points
onready var timer_text = $Game/Timer

onready var pole = $Game/Pole
onready var pole_collider = $Game/Pole/Area2D/CollisionShape2D

var pole_distance = 0.0
var pole_speedy = 1.0
var pole_speedx = 12.0
var rng = RandomNumberGenerator.new()
var direction = 0

onready var button = $Game/Button

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
	if direction == 0:	# pole going to the left
		pole.position.x -= pole_speedx * l_delta * difficult
	else:				# pole going to the right
		pole.position.x += pole_speedx * l_delta * difficult
	
	if pole_distance < 5:
		pole_distance += pole_speedy * l_delta * difficult
		if pole_distance >= 3 and pole_distance <= 4:
			pole_collider.disabled = false
		else:
			pole_collider.disabled = true
	elif pole_distance >= 5:
		pole_distance = 0
		pole.position.x = 45
		direction = rng.randi_range(0, 1)
		
	var l_scale = (pole_distance / 5)
	pole.scale = Vector2(1 * l_scale, 1 * l_scale)

func _on_Button_pressed():
	Next_Scene()
	
	
	
func Next_Scene():
	GameController.Score += points
	get_tree().change_scene(minigame_end)
