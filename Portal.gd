extends Node2D


func _ready():
	$Area2D/AnimatedSprite.play("Stretch")


func _on_Area2D_body_entered(body):
	get_tree().call_group("Gamestate", "win")
