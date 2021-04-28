extends KinematicBody2D

const TRHOW_VELOCITY = Vector2(800, -400)
var velocity = Vector2.ZERO
var minigame_end = "res://Scenes/PartyTransition.tscn"

func _ready():
	set_physics_process(false)


func _physics_process(delta):
	velocity.y += 30 * delta
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		_on_impact(collision.normal)

func _on_impact(normal : Vector2):
	#velocity = velocity.bounce(normal)
	#velocity *= 0.5 + rand_range(-0.05, 0.05)
	NextScene()

func launch(direction):
	var temp = global_transform
	var scene = get_tree().current_scene
	get_parent().remove_child(self)
	scene.add_child(self)
	global_transform = temp
	velocity = TRHOW_VELOCITY * Vector2(direction, direction) * 0.001
	set_physics_process(true)

func NextScene():
	get_tree().change_scene(minigame_end)
	

