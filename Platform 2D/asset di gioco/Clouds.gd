extends Node2D

var timeout = false

func _ready():
	$Sprite/AnimationPlayer.play("CloudDrift")


func _process(delta):
	if $Sprite/RayCast2D.is_colliding():
		fire()


func fire():
	if not timeout:
		$Sprite/RayCast2D.add_child(load("res://Platform 2D/Lightning.tscn").instance())
		$Sprite/Timer.start()
		timeout = true

func _on_Timer_timeout():
	timeout = false
