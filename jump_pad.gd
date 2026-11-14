extends Area2D

@export var bounce_kraft: float = -700.0

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.velocity.y = bounce_kraft
		print('jump')
