extends Node2D

func _ready():
	$Area2D/AnimationPlayer.play("spikeman")
	pass


func _on_Area2D_body_entered(body):
	get_tree().call_group("Gamestate", "hurt")
