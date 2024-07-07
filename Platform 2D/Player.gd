extends KinematicBody2D

var motion = Vector2(0,0); var Obama = 2

const SPEED = 1000
const GRAVITY = 50
const UP = Vector2(0,-1)
const JUMP_SPEED = 1000

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)


func apply_gravity():
	if not is_on_floor():
		motion.y += GRAVITY
	else:
		motion.y = 0
	


func jump():
	if Input.is_action_pressed("Jump") and is_on_floor() :
		motion.y -= JUMP_SPEED


func move():
	if Input.is_action_pressed("ui_left")\
	and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
		
	elif Input.is_action_pressed("ui_right")\
	and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	else:
		motion.x = 0

func animate():
	if motion.y <0:
		$AnimatedSprite.play("jump")
	elif motion.x >= 0:
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	elif motion.x <= 0:
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("idle")
