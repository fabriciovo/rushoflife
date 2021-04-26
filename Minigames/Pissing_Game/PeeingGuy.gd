extends RigidBody2D

var fallen = false

func _process(delta):
	
	if Input.is_action_just_pressed("Rot_Left"):
		AddTorqueLeft()
	
	if Input.is_action_just_pressed("Rot_Right"):
		AddTorqueRight()
	
	if rotation >= 1.5 || rotation <= -1.5:
		fallen = true
		applied_torque = 0
		angular_velocity = 0

func AddTorqueRight():
		add_torque(3.3)
		if applied_torque <  1 && applied_torque >=  0:
			applied_torque = 3

func AddTorqueLeft():
	add_torque(-3.5)
	if applied_torque >  -1 && applied_torque <=  0:
		applied_torque = -3

func _on_Left_Btn_button_down():
	AddTorqueLeft()


func _on_Right_Btn_button_down():
	AddTorqueRight()
