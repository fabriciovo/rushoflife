extends KinematicBody2D




const TRHOW_VELOCITY = Vector2(800, -400)

var velocity = Vector2.ZERO
var minigame_end = "res://Scenes/PartyTransition.tscn"
var acc = 0
var start = false

func _ready():
	set_physics_process(false)


func _physics_process(delta):
	velocity.y += 30 * delta
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		_on_impact(collision.normal)

func _on_impact(normal : Vector2):
	NextScene()

func launch():
	var temp = global_transform
	var scene = get_tree().current_scene
	get_parent().remove_child(self)
	scene.add_child(self)
	global_transform = temp
	velocity = TRHOW_VELOCITY * Vector2(acc, acc) * 0.001
	set_physics_process(true)

func acceleration():
	start = true
	print(acc)

func NextScene():
	get_tree().change_scene(minigame_end)
	

func _on_Pong_timeout():
	if start: 
		acc += 10
		if acc >= 100 : 
			acc = 0


func _on_VisibilityNotifier2D_screen_exited():
	print("foofsoijdsaoidjoiaj")
