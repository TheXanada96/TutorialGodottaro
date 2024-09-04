extends KinematicBody2D

var motion = Vector2(0,0); var Obama = 2

const SPEED = 700
const GRAVITY = 50
const UP = Vector2(0,-1)
const JUMP_SPEED = 2000
const WORLD_LIMIT = 4000
const BOOST_MULTIPLIER = 2

#var lives = 3

signal animazione


func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cambio_scena"):
		get_tree().change_scene("res://Avventura Testuale/Il MHANZ Definito.tscn")


func apply_gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("Gamestate", "end_game")
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY
	


func jump():
	if Input.is_action_pressed("Jump") and is_on_floor() :
		motion.y = -JUMP_SPEED
		$JumpSFX.play()

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
	emit_signal("animazione", motion)

#func end_game():
#	get_tree().change_scene("res://Platform 2D/EndGame.tscn")

func hurt():
	motion.y -= 1
	yield (get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED
	#lives -= 1
	$PainSFX.play()
#	if lives < 0:
#		end_game()
		
func boost():
	motion.y -= 1
	yield (get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED * BOOST_MULTIPLIER
	pass
#	if motion.y <0:
#		$PlayerObamico.play("jump")
#	elif motion.x >= 0:
#		$PlayerObamico.play("walk")
#		$PlayerObamico.flip_h = false
#	elif motion.x <= 0:
#		$PlayerObamico.play("walk")
#		$PlayerObamico.flip_h = true
#	else:
#		$PlayerObamico.play("idle")
