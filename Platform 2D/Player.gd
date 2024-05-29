extends KinematicBody2D

var motion = Vector2(0,0); var Obama = 2
const SPEED = 500

func _physics_process(delta):
	pass
	if Input.is_action_pressed("ui_left")\
	and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
		
	elif Input.is_action_pressed("ui_right")\
	and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
		
	elif Input.is_action_pressed("ui_up"):
		motion.y = -SPEED
	elif Input.is_action_pressed("ui_down"):
		motion.y = SPEED
	else:
		motion.x = 0
		motion.y = 0
	move_and_slide(motion)
